// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/profile_update_request.dart';
import 'package:part_app/model/data_model/register_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api.dart';
import 'package:part_app/view/home/trainer_app_home.dart';
import 'package:part_app/view_model/home/home_cubit.dart';

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
  int trainerIndex = 0;

  String get phoneNumber => '+$_countryCode $_phoneNo';

  set phoneNumber(phoneNumber) => _phoneNo = phoneNumber;

  set countryCode(countryCode) => _countryCode = countryCode;

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

  Future deleteAccount({String? otp}) async {
    emit(DeletingAccount());
    if (otp != null) {
      Otp otpResponse = await _authService.deleteAccount(
        otp: otp,
      );

      if (otpResponse.status == 1) {
        emit(DeletedAccount());
      } else {
        emit(DeleteAccountFailed(message: otpResponse.message));
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
    debugPrint('register started');
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
      Hive.box(Database.userBox).put("Showcase", false);
      Hive.box(Database.userBox).put("Trainer Showcase", false);
      Hive.box(Database.userBox).put("Student App Showcase", false);
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
        emit(UserAvailable(
            isAdmin: user.adminDetail != null,
            isMemberShip: _user?.adminDetail?.academy?.membershipId != null,
            member: _user?.studentDetail != null));
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

  Future updateProfile(ProfileUpdateRequest request, int? studentId,
      [String? otp, bool isToOtpPage = false]) async {
    if (!isToOtpPage) {
      emit(UpdatingUser());
    }
    UserResponse? response = studentId == null
        ? await _authService
            .updateProfile(request.toJson()..putIfAbsent('otp', () => otp))
        : await _authService.updateStudentProfile(
            request.toJson()..putIfAbsent('otp', () => otp), studentId);
    if (response?.status == 1) {
      if (!isToOtpPage) {
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
                  whatsappNo:
                      request.whatsappNo ?? user!.adminDetail!.whatsappNo,
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
        emit(UpdateOTPSuccess());
      }
    } else {
      emit(UpdateUserFailed(response?.message ?? 'Failed to update'));
    }
  }

  Future updateProfileForTrainer(ProfileUpdateRequest request, int trainerId,
      [String? otp, bool isToOtpPage = false]) async {
    if (!isToOtpPage) {
      emit(UpdatingUser());
    }
    UserResponse? response = await _authService.updateTrainerProfile(
        request.toJson()..putIfAbsent('otp', () => otp), trainerId);
    if (response?.status == 1) {
      if (!isToOtpPage) {
        validateLocalUser();

        final trainerList = user!.trainerDetail!.toList();
        final trainer =
            trainerList.firstWhere((element) => element.id == trainerId);
        final newStudent = trainer.copyWith(
          name: request.name ?? trainer.name,
          email: request.email ?? trainer.email,
          gender: request.gender ?? trainer.gender,
          whatsappNo: request.whatsappNo ?? trainer.whatsappNo,
          dob: (request.dob != null
              ? DateTime.parse(request.dob!)
              : trainer.dob),
          academy: trainer.academy!.copyWith(
            academyName: request.academyName ?? trainer.academy!.academyName,
          ),
        );
        trainerList.insert(trainerList.indexOf(trainer), newStudent);
        trainerList.remove(trainer);

        emit(
          UpdateUserSuccess(
            user: user!.copyWith(
                mobileNo: request.mobileNo ?? user!.mobileNo,
                trainerDetail: trainerList),
          ),
        );
      } else {
        emit(UpdateOTPSuccess());
      }
    } else {
      emit(UpdateUserFailed(response?.message ?? 'Failed to update'));
    }
  }

  Future sendAccountDeleteOTP() async {
    emit(SendingOtp());
    Otp? response = await _authService.generateOTPForDeleteAccount();

    if (response != null && response.status != 1) {
      emit(SendingOtpFailed(response.message, true));
    } else if (response == null) {
      emit(NetworkError());
    } else {
      emit(OTPSent(true, login: true));
    }
  }

  Future updateProfilePic(
      {BuildContext? context,
      required File profilePic,
      int? studentId,
      int? trainerId}) async {
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

  Future updateProfilePicForTrainer(
      {BuildContext? context,
      required File profilePic,
      required int trainerId,
      required String url}) async {
    // emit(UpdatingUser());
    await clearCache(url);
    MultipartFile? picFile = await Utils().generateMultiPartFile(profilePic);
    Map<String, dynamic> request = {
      'profile_pic': picFile,
    };
    UserResponse? response =
        await _authService.updateTrainerProfile(request, trainerId);

    if (response != null &&
        response.status == 1 &&
        context != null &&
        context.mounted) {
      await clearCache(url);
      Alert(context).show(message: 'User Profile Updated');
    } else {
      emit(UpdateUserFailed(response?.message ?? 'Failed to update'));
    }
  }

  Future<void> clearCache(String url) async {
    await DefaultCacheManager().removeFile(url);
    await CachedNetworkImage.evictFromCache(url);
  }

  updateUrl(BuildContext context, User user) {
    String url = '';
    if (user.trainerDetail?.first.profilePic?.isNotEmpty ?? false) {
      url = user.trainerDetail?.first.profilePic ?? '';
    }

    context.read<ProfileCubit>().emitProfileLoaded(url);
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future logout() async {
    try {
      await _authService.logout();
      await DefaultCacheManager().emptyCache();
    } catch (e) {
      log("$e");
    }
    await Database().clearForLogout();
    emit(UserNotAvailable());
  }

  Future<void> navigateToDashboard(Academy? academy, List<Trainer>? trainerList,
      List<StudentDetail>? studentsList, BuildContext context) async {
    var homeCubit = context.read<HomeCubit>();
    var cubit = context.read<AuthCubit>();
    int numberOfItems = 0;
    Database database = Database();
    String? userType = await database.getUserType();

    if (userType == null) {
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
    } else {
      if (userType == 'admin') {
        accountType = AccountType.admin;
      } else if (userType == 'trainer') {
        accountType = AccountType.trainer;
      } else {
        accountType = AccountType.student;
      }
    }
    if (numberOfItems > 1 && userType == null && context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SwitchAccount.route,
        (route) => false,
      );
    } else {
      if (accountType == AccountType.admin) {
        homeCubit.adminInit();
        Navigator.pushNamedAndRemoveUntil(
          context,
          Home.route,
          (route) => false,
        );
      } else if (accountType == AccountType.trainer) {
        trainerIndex = cubit.trainerIndex;
        homeCubit.trainerInit();
        Navigator.pushNamedAndRemoveUntil(
          context,
          TrainerAppHome.route,
          (route) => false,
        );
      } else {
        studentIndex = cubit.studentIndex;
        homeCubit.studentInit();
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
        url = "https://v1.partapp.in/images/avatars/avatar-5.png";
      } else {
        url = "https://v1.partapp.in/images/avatars/avatar-1.png";
      }
    } else if (accountType == AccountType.student) {
      if (user?.studentDetail?[studentIndex].profilePic?.isNotEmpty ?? false) {
        url =
            '${F.baseUrl}/students/${user?.studentDetail?[studentIndex].id}/images/profile-pic'
            '/${user?.studentDetail?[studentIndex].profilePic}';
      } else if (user?.adminDetail?.gender == "male") {
        url = "https://v1.partapp.in/images/avatars/avatar-5.png";
      } else {
        url = "https://v1.partapp.in/images/avatars/avatar-1.png";
      }
    } else if (accountType == AccountType.trainer) {
      if (user?.trainerDetail?[trainerIndex].profilePic?.isNotEmpty ?? false) {
        url =
            '${F.baseUrl}/trainers/${user?.trainerDetail?[trainerIndex].id}/images/profile-pic'
            '/${user?.trainerDetail?[trainerIndex].profilePic}';
      } else if (user?.adminDetail?.gender == "male") {
        url = "https://v1.partapp.in/images/avatars/avatar-5.png";
      } else {
        url = "https://v1.partapp.in/images/avatars/avatar-1.png";
      }
    }
    return url;
  }

  updateUser(User? user) {
    _user = user;
  }
}
