import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/components/document_image.dart';
import 'package:part_app/view/components/launchers.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/components/profile_pictrue.dart';
import 'package:part_app/view/components/titled_text.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/manager/edit_manager.dart';
import 'package:part_app/view/manager/edit_salary.dart';
import 'package:part_app/view/manager/manager_branches.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerDetails extends StatefulWidget {
  static const route = '/manager/details';
  final int managerId;

  const ManagerDetails({Key? key, required this.managerId}) : super(key: key);

  @override
  State<ManagerDetails> createState() => _ManagerDetailsState();
}

class _ManagerDetailsState extends State<ManagerDetails> {
  bool active = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ManagerCubit>().getManagerById(
            id: widget.managerId,
          );

      context.read<ManagerCubit>().cleanup();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManagerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Manager Details'),
      body: BlocConsumer<ManagerCubit, ManagerState>(
        listener: (context, state) {
          if (state is FetchingManager) {
            Loader(context).show();
          }
          if (state is ManagerFetched) {
            Navigator.pop(context);
          }
          if (state is FetchingManagerFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          Manager? manager = cubit.manager;
          Manager? managerDetails = manager?.managerDetail?[0];
          return SafeArea(
            child: ListView(
              children: [
                Center(
                  child: ProfilePicture(
                    imageUrl:
                        '${F.baseUrl}/admin/images/manager/${managerDetails?.id}/${managerDetails?.profilePic}',
                    onEdit: () {},
                    onChange: (File value) {
                      cubit.updateProfile(profilePic: value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${managerDetails?.name}',
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
                      value: managerDetails?.isActive == 1,
                      onChanged: (value) {
                        active = value;
                        CommonDialog(
                          context: context,
                          message:
                              'Do You Want To ${manager?.isActive == 1 ? 'Deactivate' : 'Activate'} The Branch Manager?',
                          subMessage: '${managerDetails?.name}',
                          onTap: () {
                            Navigator.pop(context);
                            cubit.activateManager(
                              id: managerDetails!.id,
                              status: active ? 1 : 0,
                            );
                          },
                        ).show();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Launchers(
                  phoneNo: '+${manager?.countryCode}${manager?.mobileNo}',
                  whatsappNo:
                      '+${manager?.countryCode}${manager?.managerDetail?[0].whatsappNo}',
                  email: '${manager?.email}',
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
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: managerDetails?.branches?.length ?? 0,
                              itemBuilder: (context, index) {
                                Branch? branch =
                                    managerDetails?.branches?[index];
                                return Text(
                                  branch?.branchName ?? '',
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ManagerBranches.route,
                              );
                            },
                            child: Container(
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
                        'Salary History',
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
                            subText: '${managerDetails?.gender?.capitalize()}',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, EditManager.route);
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
                      TitledText(
                        title: 'Mobile No',
                        subText: manager?.mobileNo ?? 'N/A',
                      ),
                      TitledText(
                        title: 'Whatsapp No',
                        subText: '${managerDetails?.whatsappNo}',
                      ),
                      TitledText(
                        title: 'Date Of Birth',
                        subText: '${managerDetails?.dob?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Email Id',
                        subText: '${managerDetails?.email}',
                      ),
                      TitledText(
                        title: 'Address',
                        subText: '${managerDetails?.address}',
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
                          DocumentImage(
                            imageUrl:
                                '${F.baseUrl}/admin/documents/manager/${managerDetails?.id}/${managerDetails?.document_1}',
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          DocumentImage(
                            imageUrl:
                                '${F.baseUrl}/admin/documents/manager/${managerDetails?.id}/${managerDetails?.document_2}',
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
                            title: 'UPI ID',
                            titleColor: Colors.white,
                            subText: managerDetails?.upiId ?? 'UPI Not Added',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                EditSalaryManager.route,
                              );
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Pay Day',
                        titleColor: Colors.white,
                        subText: '${managerDetails?.salaryDate}',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Amount',
                        titleColor: Colors.white,
                        subText:
                            'Rs. ${managerDetails?.salaryAmount?.toString().currencyFormat()}/-',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Joining Date',
                        titleColor: Colors.white,
                        subText: '${managerDetails?.doj?.toDDMMYYY()}',
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
