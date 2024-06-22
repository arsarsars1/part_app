import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/auth/otp_verify.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class DeleteAccount extends StatelessWidget {
  static const route = '/delete-account';
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Confirmation',
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is NetworkError) {
            AlertBox.showErrorAlert(context);
          } else if (state is SendingOtp) {
            Loader(context, message: 'Please wait').show();
          }

          // if the otp fails notifies the UI with an alert
          if (state is SendingOtpFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
          // if the OTP is sent show the User with the verification UI
          else if (state is OTPSent) {
            Navigator.pop(context);
            Navigator.pushNamed(context, OTPVerify.route,
                arguments: OTPRoutes.deleteAccount);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.liteDark,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dear User, we would like to remind you that before you delete your account, please ensure that you have read the following.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Account deletion will permanently delete all relevant information from your PartApp account, including but not limited to:',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '1. Deletion of personal data',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    '2. Deletion of all the progress in the attendance module',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    '3. Deletion of your salary and fees data',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    '4. Lead management data will be deleted permanently',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Tapping "Continue" will permanently delete your PartApp account',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Button(
                height: UIConstants.buttonHeight,
                onTap: () {
                  cubit.phoneNumber = cubit.user?.adminDetail?.whatsappNo;
                  cubit.sendAccountDeleteOTP();
                },
                title: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
