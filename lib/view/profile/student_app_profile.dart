import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/profile_update_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/profile_pic/cubit/profile_cubit.dart';

import '../../flavors.dart';

class StudentAppProfile extends StatefulWidget {
  static const route = '/student-app-profile';

  const StudentAppProfile({super.key});

  @override
  State<StudentAppProfile> createState() => _StudentAppProfileState();
}

class _StudentAppProfileState extends State<StudentAppProfile> {
  String? name;
  String? email;
  String? dob;
  String? gender;
  String? waNumber;
  String? academyName;
  String? academyType;

  bool selected = true;
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController academyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = context.read<AuthCubit>();
      User? user = cubit.user;
      dobController.text = cubit.accountType == AccountType.admin
          ? (user?.adminDetail?.dob?.toDateString() ?? '')
          : (cubit.user?.studentDetail?[cubit.studentIndex].dob
                  ?.toDateString() ??
              '');
    });
    var cubit = context.read<AuthCubit>();
    selected = (context
                .read<AuthCubit>()
                .user
                ?.adminDetail
                ?.whatsappNo
                ?.isEmpty ??
            true) ||
        (context.read<AuthCubit>().user?.mobileNo ==
            (cubit.accountType == AccountType.admin
                ? cubit.user?.adminDetail?.whatsappNo
                : cubit.user?.studentDetail?[cubit.studentIndex].whatsappNo));
    if (context.read<AuthCubit>().accountType == AccountType.student) {
      final academyId = context
          .read<AuthCubit>()
          .user
          ?.studentDetail?[context.read<AuthCubit>().studentIndex]
          .academy
          ?.academyTypeId;
      academyType = academyId != null
          ? context
              .read<CountryCubit>()
              .academyTypes
              .firstWhere((element) => element.id == academyId)
              .title
          : null;

      gender = context
          .read<AuthCubit>()
          .user
          ?.studentDetail?[context.read<AuthCubit>().studentIndex]
          .gender;
    } else if (context.read<AuthCubit>().accountType == AccountType.admin) {
      final academyId =
          context.read<AuthCubit>().user?.adminDetail?.academy?.academyTypeId;
      academyType = academyId != null
          ? context
              .read<CountryCubit>()
              .academyTypes
              .firstWhere((element) => element.id == academyId)
              .title
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    bool isAdmin = cubit.accountType == AccountType.admin;
    return Scaffold(
      appBar: CommonBar(
        title: isAdmin ? 'Admin Profile Details' : 'Profile Details',
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UpdateUserSuccess) {
            Alert(context).show(message: 'User Profile Updated');
            context.read<AuthCubit>().updateUser(state.user);
          } else if (state is UpdateUserFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is UpdatingUser) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      String url = '';
                      if (state is ProfileInitial) {
                        url = cubit.getUserProfilePic();
                      } else if (state is ProfileLoaded && isAdmin) {
                        url = '${F.baseUrl}/admin/images/profile-pic'
                            '/${state.profilePic}';
                      } else if (state is ProfileLoaded && !isAdmin) {
                        url =
                            '${F.baseUrl}/students/${cubit.user?.studentDetail?[cubit.studentIndex].id}/images/profile-pic/${state.profilePic}';
                      }
                      return ProfilePicture(
                        imageUrl: url,
                        onEdit: () {},
                        onAvatar: (File value) {},
                        onChange: (File value) {
                          cubit.updateProfilePic(
                              profilePic: value,
                              studentId: isAdmin
                                  ? null
                                  : cubit.user
                                      ?.studentDetail?[cubit.studentIndex].id,
                              context: context);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonField(
                  initialValue: cubit.user?.mobileNo,
                  enabled: false,
                  suffixIcon: const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.greenAccent,
                  ),
                  fillColor: AppColors.disabledColor,
                  textColor: Colors.black,
                  title: 'Your Phone Number *',
                  onChange: (value) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Button(
                    width: 200.w,
                    height: UIConstants.buttonHeight,
                    disable: true,
                    onTap: () {
                      // Navigator.pushNamed(context, ChangePhoneScreen.route);
                    },
                    title: 'Change Phone Number',
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Is The Above Number Your Whatsapp Number?',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25.0,
                        padding: const EdgeInsets.only(right: 16),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            trackColor: AppColors.grey500,
                            value: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = !selected;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (!selected)
                  Column(
                    children: [
                      CommonField(
                        length: 10,
                        inputType: TextInputType.number,
                        phoneField: true,
                        title: 'Whatsapp Phone Number *',
                        initialValue: isAdmin
                            ? cubit.user?.adminDetail?.whatsappNo
                            : cubit.user?.studentDetail?[cubit.studentIndex]
                                .whatsappNo,
                        onChange: (value) {
                          waNumber = value;
                        },
                        hint: 'Eg: 9876543210',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                CommonField(
                  initialValue: isAdmin
                      ? cubit.user?.adminDetail?.name
                      : cubit.user?.studentDetail?[cubit.studentIndex].name,
                  title: 'Enter you name *',
                  hint: 'Name',
                  onChange: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  initialValue: isAdmin
                      ? cubit.user?.adminDetail?.email
                      : cubit.user?.studentDetail?[cubit.studentIndex].email,
                  title: 'Enter Email ',
                  hint: 'Eg: contact@polestar.com',
                  onChange: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  onTap: datePicker,
                  disabled: true,
                  controller: dobController,
                  hint: 'dd/mm/yyyy',
                  title: 'Date of Birth',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                gender == null
                    ? CommonField(
                        defaultItem: cubit.user?.adminDetail?.gender != null
                            ? DefaultValues().genders.firstWhere((element) =>
                                element.title?.toLowerCase() ==
                                context
                                    .read<AuthCubit>()
                                    .user
                                    ?.adminDetail
                                    ?.gender
                                    ?.toLowerCase())
                            : null,
                        title: 'Gender',
                        onChange: (value) {
                          gender = value?.title;
                        },
                        hint: 'Select Gender',
                        dropDown: true,
                        dropDownItems: DefaultValues().genders,
                      )
                    : CommonField(
                        disabled: true,
                        initialValue: gender,
                        title: 'Gender',
                        hint: 'male',
                        onChange: (value) {
                          // email = value;
                        },
                      ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  disabled: true,
                  enabled: isAdmin,
                  initialValue: isAdmin
                      ? cubit.user?.adminDetail?.academy?.academyName
                      : cubit.user?.studentDetail?[cubit.studentIndex].academy
                          ?.academyName,
                  title: isAdmin ? 'Academy Name *' : 'Academy Name',
                  hint: 'Enter the academy name',
                  onChange: (value) {
                    academyName = value;
                  },
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // CommonField(
                //   initialValue: context
                //       .read<CountryCubit>()
                //       .academyTypes
                //       .firstWhere((element) =>
                //           element.id ==
                //           cubit.user?.studentDetail?[cubit.studentIndex].academy
                //               ?.academyTypeId)
                //       .title,
                //   disabled: true,
                //   title: 'Academy Type',
                //   hint: 'Enter the academy name',
                //   onChange: (value) {
                //     // academyName = value;
                //   },
                // ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (isAdmin &&
                      !RegExp(emailRegex).hasMatch(
                          email ?? cubit.user?.adminDetail?.email ?? "")) {
                    Alert(context).show(message: 'Error enter a valid email');
                    return;
                  }
                  // if (!isAdmin &&
                  //     !RegExp(emailRegex).hasMatch(email ??
                  //         cubit
                  //             .user?.studentDetail?[cubit.studentIndex].email ??
                  //         "")) {
                  //   Alert(context).show(message: 'Error enter a valid email');
                  //   return;
                  // }
                  ProfileUpdateRequest request = ProfileUpdateRequest(
                    name: name,
                    email: email,
                    gender: gender,
                    whatsappNo: selected ? cubit.user?.mobileNo : waNumber,
                    academyName: academyName,
                    dob: dob,
                  );
                  cubit.updateProfile(
                      request,
                      isAdmin
                          ? null
                          : cubit.user?.studentDetail?[cubit.studentIndex].id);
                }
              },
              title: 'Update',
            ),
          ),
        ),
      ),
    );
  }

  // method to get the date for [ dob ]
  void datePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        dob = value.toServerYMD();
        dobController.text = value.toDateString();
      }
    });
  }
}
