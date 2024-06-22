import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAccount extends StatelessWidget {
  static const route = '/trainer-account';
  const TrainerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Account Details',
      ),
      body: Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account Holder Name  :',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        '${cubit.user?.trainerDetail?[cubit.trainerIndex].name}',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone Number  :',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    Text(
                      '${cubit.user?.trainerDetail?[cubit.trainerIndex].whatsappNo}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email  :',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        '${cubit.user?.trainerDetail?[cubit.trainerIndex].email}',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date of birth  :',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    Text(
                      '${cubit.user?.trainerDetail?[cubit.trainerIndex].dob?.toDateString()}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Joining date  :',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    Text(
                      '${cubit.user?.trainerDetail?[cubit.trainerIndex].doj?.toDateString()}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Button(
          //     height: UIConstants.buttonHeight,
          //     onTap: () {
          //       Navigator.pushNamed(context, DeleteAccount.route);
          //     },
          //     title: 'Delete Account',
          //   ),
          // ),
        ],
      ),
    );
  }
}
