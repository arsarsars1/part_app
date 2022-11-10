import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/action_icon.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/profile_pictrue.dart';
import 'package:part_app/view/components/titled_text.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerDetails extends StatefulWidget {
  static const route = '/manager/details';

  const ManagerDetails({Key? key}) : super(key: key);

  @override
  State<ManagerDetails> createState() => _ManagerDetailsState();
}

class _ManagerDetailsState extends State<ManagerDetails> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Manager Details'),
      body: BlocBuilder<ManagerCubit, ManagerState>(
        builder: (context, state) {
          Manager? manager = cubit.manager;
          return SafeArea(
            child: ListView(
              children: [
                Center(
                  child: ProfilePicture(
                    imageUrl:
                        'https://dev.partapp.in/images/trainers/${manager?.profilePic}',
                    onEdit: () {},
                    onChange: (File value) {},
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${manager?.user?.name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 25.0.h,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CupertinoSwitch(
                      trackColor: AppColors.grey500,
                      value: active,
                      onChanged: (value) {
                        setState(() {
                          active = !active;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionIcon(
                      asset: Assets.phone,
                      color: const Color(0XFF0072FF),
                      onTap: () {},
                    ),
                    ActionIcon(
                      asset: Assets.message,
                      color: const Color(0XFFFFAC04),
                      onTap: () {},
                    ),
                    ActionIcon(
                      asset: Assets.whatsApp,
                      color: const Color(0XFF00F260),
                      onTap: () {},
                    ),
                    ActionIcon(
                      asset: Assets.email,
                      color: const Color(0XFFE56667),
                      onTap: () {},
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Allocated Branches',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(manager?.branches?[0].branchName ?? ''),
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.defaultBlue,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        'Salary Details',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
                            ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitledText(
                            title: 'Gender',
                            subText: '${manager?.gender}',
                          ),
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      TitledText(
                        title: 'Mobile No',
                        subText: manager?.user?.mobileNo ?? 'N/A',
                      ),
                      TitledText(
                        title: 'Date Of Birth',
                        subText: '${manager?.dob?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Email Id',
                        subText: '${manager?.email}',
                      ),
                      const TitledText(
                        title: 'Address',
                        subText: 'N/A',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text('ID Proof Images Max Of 2 Nos.'),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 77.h,
                            width: 93.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                              // image: trainer?.documents != null
                              //     ? DecorationImage(image: FileImage(document1!))
                              //     : null,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 77.h,
                            width: 93.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                              // image: trainer?.documents != null
                              //     ? DecorationImage(image: FileImage(document1!))
                              //     : null,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(child: Text('Salary Details')),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.liteDark,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitledText(
                            title: 'UPI ID',
                            titleColor: Colors.white,
                            subText: 'N/A',
                          ),
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Pay Day',
                        titleColor: Colors.white,
                        subText: '${manager?.salaryDate}',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Amount',
                        titleColor: Colors.white,
                        subText:
                            'Rs. ${manager?.salaryAmount?.currencyFormat()}/-',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Joining Date',
                        titleColor: Colors.white,
                        subText: '${manager?.doj?.toDateString()}',
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
