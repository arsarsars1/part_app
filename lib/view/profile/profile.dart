import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/profile_update_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/constants/regex.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/cubits.dart';

class Profile extends StatefulWidget {
  static const route = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      User? user = context.read<AuthCubit>().user;
      dobController.text = user?.adminDetail?.dob?.toDateString() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Admin Profile Details',
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is UpdateUserSuccess) {
          Alert(context).show(message: 'User Profile Updated');
          Navigator.pushNamedAndRemoveUntil(
            context,
            SplashScreen.route,
            (route) => false,
          );
        } else if (state is UpdateUserFailed) {
          Alert(context).show(message: state.message);
        }
      }, builder: (context, state) {
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
                child: ProfilePicture(
                  imageUrl: context
                              .read<AuthCubit>()
                              .user
                              ?.adminDetail
                              ?.profilePic !=
                          ""
                      ? '${F.baseUrl}/admin/images/admin/${context.read<AuthCubit>().user?.adminDetail?.id}'
                          '/${context.read<AuthCubit>().user?.adminDetail?.profilePic}'
                      : context.read<AuthCubit>().user?.adminDetail?.gender ==
                              "male"
                          ? "https://dev.partapp.in/images/avatars/avatar-5.png"
                          : "https://dev.partapp.in/images/avatars/avatar-1.png",
                  onEdit: () {},
                  onAvatar: (File value) {},
                  onChange: (File value) {
                    // context
                    //     .read<StudentCubit>()
                    //     .updateProfilePic(profilePic: value);
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CommonField(
                initialValue: context.read<AuthCubit>().user?.mobileNo,
                suffixIcon: const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.greenAccent,
                ),
                fillColor: AppColors.disabledColor,
                disabled: true,
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
                  height: 30.h,
                  onTap: () {},
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
                        'Is the above number your whatsapp number ?',
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
                      title: 'Whatsapp Phone Number *',
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
                initialValue: context.read<AuthCubit>().user?.adminDetail?.name,
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
                initialValue:
                    context.read<AuthCubit>().user?.adminDetail?.email,
                title: 'Enter Email *',
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
                title: 'Date of Birth *',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                defaultItem:
                    context.read<AuthCubit>().user?.adminDetail?.gender != null
                        ? DefaultValues().genders.firstWhere((element) =>
                            element.title?.toLowerCase() ==
                            context
                                .read<AuthCubit>()
                                .user
                                ?.adminDetail
                                ?.gender
                                ?.toLowerCase())
                        : null,
                title: 'Gender *',
                onChange: (value) {
                  gender = value?.title;
                },
                hint: 'Select Gender',
                dropDown: true,
                dropDownItems: DefaultValues().genders,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue: context
                    .read<AuthCubit>()
                    .user
                    ?.adminDetail
                    ?.academy
                    ?.academyName,
                title: 'Academy Name *',
                hint: 'Enter the academy name',
                onChange: (value) {
                  academyName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Academy Type *',
                defaultItem: context
                            .read<AuthCubit>()
                            .user
                            ?.adminDetail
                            ?.academy
                            ?.academyTypeId !=
                        null
                    ? context.read<CountryCubit>().academyTypes.firstWhere(
                        (element) =>
                            element.id ==
                            context
                                .read<AuthCubit>()
                                .user
                                ?.adminDetail
                                ?.academy
                                ?.academyTypeId)
                    : null,
                onChange: (value) {
                  academyType = value?.title;
                },
                hint: 'Select Academy Type',
                dropDown: true,
                dropDownItems: context.read<CountryCubit>().academyTypes,
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (!RegExp(emailRegex).hasMatch(email ??
                      context.read<AuthCubit>().user?.adminDetail?.email ??
                      "")) {
                    Alert(context).show(message: 'Error enter a valid email');
                    return;
                  }
                  ProfileUpdateRequest request = ProfileUpdateRequest(
                    name: name,
                    email: email,
                    gender: gender,
                    whatsappNo: waNumber,
                    academyName: academyName,
                    dob: dob,
                  );
                  cubit.updateProfile(request);
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
