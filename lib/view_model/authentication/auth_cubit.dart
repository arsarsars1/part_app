import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/profile_update_request.dart';
import 'package:part_app/model/data_model/register_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api.dart';

import '../../flavors.dart';
import '../../model/data_model/students_response.dart';
import '../../model/data_model/trainer_response.dart';
import '../../view/account/switch_account.dart';
import '../../view/components/alert.dart';
import '../../view/home/home.dart';
import '../../view/home/student_app_home.dart';
import '../profile_pic/cubit/profile_cubit.dart';
import '../utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  final AuthService _authService = AuthService();

  String? _phoneNo;
  String? _countryCode;
  User? _user;
  String? _token;
  int studentIndex = 0;

  String get phoneNumber => '+$_countryCode $_phoneNo';

  RegisterRequest _registerRequest = const RegisterRequest();

  String? get token => _token;

  User? get user => _user;

  AccountType? accountType;

  /// METHOD TO GENERATE THE OTP FOR LOGIN
  ///
  /// [login] is a required field and it determines the API path to call
  /// params [countryCode] & [phoneNo] are nullable fields
  /// method will call the API only if the [countryCode] &  phoneNo] are valid
  /// else it will notify the UI about the validation

  Future generateOTP({
    String? countryCode,
    String? phoneNo,
    bool resend = false,
    required bool login,
  }) async {
    if (!resend) {
      _phoneNo = phoneNo;
      _countryCode = countryCode;
    }
    // calls the api
    if (_phoneNo != null && _countryCode != null) {
      _registerRequest = _registerRequest.copyWith(
        countryCode: _countryCode,
        mobileNo: _phoneNo,
      );

      if (login) {
        emit(SendingOtp());
      } else {
        emit(SendingRegisterOtp(resend));
      }
      Otp? response = await _authService.generateOTP(
        countryCode: _countryCode!,
        phoneNo: _phoneNo!,
        login: login,
      );

      if (response != null && response.status != 1) {
        emit(SendingOtpFailed(response.message, login));
      } else if (response == null) {
        emit(NetworkError());
      } else {
        emit(OTPSent(resend, login: login));
      }
    }
  }

  Future login({String? password}) async {
    if (password != null) {
      emit(Authenticating());
      UserResponse userResponse = await _authService
          .login(
        phoneNo: _phoneNo!,
        countryCode: _countryCode!,
        password: password,
      )
          .onError((error, stackTrace) {
        emit(LoginFailed('Login failed, Please try again'));
      });

      if (userResponse.status == 1) {
        _user = userResponse.user;
        _token = userResponse.token;
        await Database().setToken(userResponse);
        await Database().setUser(userResponse);

        emit(LoginSuccess(userResponse.user != null));
      } else {
        emit(LoginFailed(
            userResponse.message ?? 'Login failed, Please try again'));
      }
    }
  }

  Future validateRegisterOTP({String? otp}) async {
    if (otp != null) {
      Otp otpResponse = await _authService.validateOTP(
        phoneNo: _phoneNo!,
        countryCode: _countryCode!,
        otp: otp,
      );

      if (otpResponse.status == 1) {
        emit(RegisterOTPValidated());
      } else {
        emit(RegisterOTPFailed(message: otpResponse.message));
      }
    }
  }

  void updateWANumber(String? number) {
    _registerRequest =
        _registerRequest.copyWith(whatsappNo: number ?? _phoneNo);
  }

  void adminDetails(String? name, String? email, String? dob, String? gender) {
    _registerRequest = _registerRequest.copyWith(
      name: name,
      email: email,
      dob: dob,
      gender: gender,
      mobileNo: _phoneNo,
      countryCode: _countryCode,
      isTrainer: '0',
    );
  }

  void academyDetails(String? name, int? typeId) {
    _registerRequest = _registerRequest.copyWith(
      academyName: name,
      academyTypeId: typeId,
    );
  }

  void branchDetails(
      {required String branchName,
      required String address,
      required String pinCode,
      required int countryId,
      required int districtId,
      required int stateId}) {
    _registerRequest = _registerRequest.copyWith(
      branchAddress: address,
      branchPincode: pinCode,
      branchName: branchName,
      countryId: countryId,
      stateId: stateId,
      districtId: districtId,
    );
    register();
  }

  Future register() async {
    emit(RegisteringUser());
    UserResponse? value = await _authService.register(
      registerRequest: _registerRequest,
    );
    if (value == null) {
      emit(NetworkError());
    } else if (value.status == 1) {
      _token = value.token;
      _user = value.user;
      Hive.box(Database.userBox).put(Database.token, value.token);
      Hive.box(Database.userBox).put(Database.userData, jsonEncode(value));
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailed(value.message ?? ' Failed to register the user'));
    }
  }

  /// method to initialize the [ 401 ] listener to handle
  /// alert
  Future init401Listener() async {
    ApiClient().controller?.stream.listen((event) {
      if (event == 401) {
        emit(UnAuthenticated());
      } else if (event == 600) {
        emit(NetworkError());
      }
    });
  }

  Future validateLocalUser() async {
    String? userToken = Database().getToken();

    if (userToken != null) {
      _token = userToken;

      var user = await getUser();

      if (user != null) {
        emit(
          UserAvailable(
            member: _user?.adminDetail?.academy?.membershipId != null ||
                _user?.studentDetail != null,
          ),
        );
      } else {
        emit(UserNotAvailable());
      }
    } else {
      emit(UserNotAvailable());
    }
  }

  Future<User?> getUser() async {
    // gets the latest profile data from api
    UserResponse? response = await _authService.getProfile();
    if (response != null) {
      // save the user data to local
      await Database().setUser(response);

      _user = response.user;
    }

    return response?.user;
  }

  Future updateProfile(ProfileUpdateRequest request, int? studentId) async {
    emit(UpdatingUser());
    UserResponse? response = studentId == null
        ? await _authService.updateProfile(request.toJson())
        : await _authService.updateStudentProfile(request.toJson(), studentId);
    if (response?.status == 1) {
      validateLocalUser();

      if (studentId == null) {
        emit(
          UpdateUserSuccess(
            user: user!.copyWith(
              mobileNo: request.mobileNo ?? user!.mobileNo,
              adminDetail: user!.adminDetail!.copyWith(
                name: request.name ?? user!.adminDetail!.name,
                email: request.email ?? user!.adminDetail!.email,
                gender: request.gender ?? user!.adminDetail!.gender,
                whatsappNo: request.whatsappNo ?? user!.adminDetail!.whatsappNo,
                dob: (request.dob != null
                    ? DateTime.parse(request.dob!)
                    : user!.adminDetail!.dob),
                academy: user!.adminDetail!.academy!.copyWith(
                  academyName: request.academyName ??
                      user!.adminDetail!.academy!.academyName,
                ),
              ),
            ),
          ),
        );
      } else {
        final studentList = user!.studentDetail!.toList();
        final student =
            studentList.firstWhere((element) => element.id == studentId);
        final newStudent = student.copyWith(
          name: request.name ?? student.name,
          email: request.email ?? student.email,
          gender: request.gender ?? student.gender,
          whatsappNo: request.whatsappNo ?? student.whatsappNo,
          dob: (request.dob != null
              ? DateTime.parse(request.dob!)
              : student.dob),
          academy: student.academy!.copyWith(
            academyName: request.academyName ?? student.academy!.academyName,
          ),
        );
        studentList.insert(studentList.indexOf(student), newStudent);
        studentList.remove(student);

        emit(
          UpdateUserSuccess(
            user: user!.copyWith(
                mobileNo: request.mobileNo ?? user!.mobileNo,
                studentDetail: studentList),
          ),
        );
      }
    } else {
      emit(UpdateUserFailed(response?.message ?? 'Failed to update'));
    }
  }

  Future updateProfilePic(
      {BuildContext? context, required File profilePic, int? studentId}) async {
    // emit(UpdatingUser());
    MultipartFile? picFile = await Utils().generateMultiPartFile(profilePic);
    Map<String, dynamic> request = {
      'profile_pic': picFile,
    };
    UserResponse? response = studentId == null
        ? await _authService.updateProfile(request)
        : await _authService.updateStudentProfile(request, studentId);

    if (response?.status == 1 && context != null && context.mounted) {
      Alert(context).show(message: 'User Profile Updated');
      String url = '';
      if (response?.user?.adminDetail?.profilePic?.isNotEmpty ?? false) {
        url = response!.user!.adminDetail!.profilePic!;
      } else if (response?.user?.studentDetail?.first.profilePic?.isNotEmpty ??
          false) {
        url = response?.user?.studentDetail?.first.profilePic ?? '';
      }
      context.read<ProfileCubit>().emitProfileLoaded(url);
    } else {
      emit(UpdateUserFailed(response?.message ?? 'Failed to update'));
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      log("$e");
    }
    await Database().clearForLogout();
    emit(UserNotAvailable());
  }

  void navigateToDashboard(Academy? academy, List<Trainer>? trainerList,
      List<StudentDetail>? studentsList, BuildContext context) {
    int numberOfItems = 0;
    if (academy != null) {
      numberOfItems++;
      accountType = AccountType.admin;
    }

    if (trainerList != null && trainerList.isNotEmpty) {
      numberOfItems += trainerList.length;
      accountType = AccountType.trainer;
    }
    if (studentsList != null && studentsList.isNotEmpty) {
      numberOfItems += studentsList.length;
      accountType = AccountType.student;
    }
    if (numberOfItems > 1) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SwitchAccount.route,
        (route) => false,
      );
    } else {
      if (accountType == AccountType.admin) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Home.route,
          (route) => false,
        );
      } else if (accountType == AccountType.trainer) {
        Alert(context).show(message: 'WIP');
      } else {
        studentIndex = 0;
        Navigator.pushNamedAndRemoveUntil(
          context,
          StudentAppHome.route,
          (route) => false,
        );
      }
    }
  }

  String getUserProfilePic() {
    String url = '';
    if (accountType == AccountType.admin) {
      if (user?.adminDetail?.profilePic?.isNotEmpty ?? false) {
        url = '${F.baseUrl}/admin/images/profile-pic'
            '/${user?.adminDetail?.profilePic}';
      } else if (user?.adminDetail?.gender == "male") {
        url = "https://dev.partapp.in/images/avatars/avatar-5.png";
      } else {
        url = "https://dev.partapp.in/images/avatars/avatar-1.png";
      }
    } else if (accountType == AccountType.student) {
      if (user?.studentDetail?[studentIndex].profilePic?.isNotEmpty ?? false) {
        url =
            '${F.baseUrl}/students/${user?.studentDetail?[studentIndex].id}/images/profile-pic'
            '/${user?.studentDetail?[studentIndex].profilePic}';
      } else if (user?.adminDetail?.gender == "male") {
        url = "https://dev.partapp.in/images/avatars/avatar-5.png";
      } else {
        url = "https://dev.partapp.in/images/avatars/avatar-1.png";
      }
    }
    return url;
  }

  updateUser(User? user) {
    _user = user;
  }
}
