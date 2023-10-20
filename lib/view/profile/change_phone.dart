import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/profile_update_request.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

import '../auth/otp_verify.dart';

class ChangePhoneScreen extends StatefulWidget {
  static const route = '/change_phone';

  const ChangePhoneScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  String? mobileNo;

  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    bool isAdmin = cubit.accountType == AccountType.admin;
    return Scaffold(
      appBar: const CommonBar(
        title: 'Change Phone Number',
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is UpdateUserSuccess) {
          Alert(context).show(message: 'User Profile Updated');
          context.read<AuthCubit>().updateUser(state.user);
        } else if (state is UpdateUserFailed) {
          Alert(context).show(message: state.message);
        } else if (state is UpdateOTPSuccess) {
          if (mobileNo?.isNotEmpty ?? false) {
            cubit.phoneNumber = mobileNo;
            cubit.countryCode = '91';
            Navigator.pushNamed(context, OTPVerify.route,
                arguments: OTPRoutes.mobileNumberChange);
          }
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
              CommonField(
                initialValue: cubit.user?.mobileNo,
                suffixIcon: const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.greenAccent,
                ),
                fillColor: AppColors.disabledColor,
                textColor: Colors.black,
                title: 'Enter Your Phone Number',
                onChange: (value) {
                  mobileNo = value;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Button(
                  width: 100.w,
                  height: 30.h,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ProfileUpdateRequest request = ProfileUpdateRequest(
                        mobileNo: mobileNo,
                        countryCode: '91',
                      );
                      if (mobileNo?.isNotEmpty ?? false) {
                        cubit.updateProfile(
                            request,
                            isAdmin
                                ? null
                                : cubit.user?.studentDetail?[cubit.studentIndex]
                                    .id,
                            null,
                            true);
                      }
                    }
                  },
                  title: 'Update',
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
