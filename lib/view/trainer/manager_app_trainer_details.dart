import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/components/document_image.dart';
import 'package:part_app/view/components/launchers.dart';
import 'package:part_app/view/components/profile_picture.dart';
import 'package:part_app/view/components/titled_text.dart';
import 'package:part_app/view/trainer/edit_salary_trainer.dart';
import 'package:part_app/view/trainer/edit_trainer.dart';
import 'package:part_app/view/trainer/manager_app_assigned_batches.dart';
import 'package:part_app/view/trainer/manager_app_trainer_branches.dart';
import 'package:part_app/view/trainer/manager_app_trainer_salary_slips.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppTrainerDetails extends StatefulWidget {
  static const route = '/trainer/manager-app-trainer-details';

  const ManagerAppTrainerDetails({super.key});

  @override
  State<ManagerAppTrainerDetails> createState() =>
      _ManagerAppTrainerDetailsState();
}

class _ManagerAppTrainerDetailsState extends State<ManagerAppTrainerDetails> {
  bool active = true;
  AuthCubit? authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().cleanup();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrainerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Trainer Profile'),
      body: BlocConsumer<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is TrainerStatusUpdated) {
            Alert(context).show(
              message:
                  'Trainer ${state.activated ? 'Activated.' : 'Deactivated.'}',
            );
          }
        },
        builder: (context, state) {
          Trainer? trainer = cubit.trainer?.trainerDetail![0];
          if (state is TrainerDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: ListView(
              children: [
                Center(
                  child: ProfilePicture(
                    imageUrl: trainer?.profilePic != ""
                        ? '${F.baseUrl}'
                            '/admin/images/trainer/'
                            '${trainer?.id}/${trainer?.profilePic}'
                        : trainer?.gender == "male"
                            ? "https://v1.partapp.in/images/avatars/avatar-5.png"
                            : "https://v1.partapp.in/images/avatars/avatar-1.png",
                    onEdit: () {},
                    onChange: (File value) {
                      cubit.updateProfilePic(profilePic: value);
                    },
                    onAvatar: (File value) {},
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${trainer?.name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
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
                      value: trainer?.isActive == 1,
                      onChanged: (value) {
                        CommonDialog(
                          context: context,
                          message:
                              'Do You Want To ${trainer?.isActive == 1 ? 'Deactivate' : 'Activate'} The Below Trainer?',
                          subMessage: '${trainer?.name}',
                          onTap: () {
                            active = value;
                            Navigator.pop(context);
                            cubit.trainerStatusForManager(
                                id: trainer!.id,
                                status: active ? 1 : 0,
                                managerId: authCubit
                                        ?.user
                                        ?.managerDetail?[
                                            authCubit?.managerIndex ?? 0]
                                        .id ??
                                    0);
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
                  phoneNo:
                      '+${cubit.trainer?.countryCode}${cubit.trainer?.mobileNo}',
                  whatsappNo:
                      '+${cubit.trainer?.countryCode}${trainer?.whatsappNo}',
                  email: '${trainer?.email}',
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
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                            ),
                      ),
                      trainer!.branches!.isEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('No Branches Allocated'),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ManagerAppTrainerBranches.route,
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
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: trainer.branches?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      Branch? branch = trainer.branches?[index];
                                      bool active = branch?.isActive == 1;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        child: Text(
                                          branch?.branchName ?? '',
                                          style: !active
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: AppColors.grey700,
                                                  )
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ManagerAppTrainerBranches.route,
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ManagerAppAssignedBatches.route,
                  ),
                  child: Container(
                    height: UIConstants.buttonHeight,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
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
                          'Assigned Batches',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
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
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ManagerAppTrainerSalarySlips.route,
                  ),
                  child: Container(
                    height: UIConstants.buttonHeight,
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
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
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
                            subText: '${trainer.gender?.capitalize()}',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, EditTrainer.route);
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
                        subText: '${cubit.trainer?.mobileNo}',
                      ),
                      TitledText(
                        title: 'Whatsapp No',
                        subText: '${trainer.whatsappNo}',
                      ),
                      TitledText(
                        title: 'Date Of Birth',
                        subText: trainer.dob == null
                            ? 'Not Provided'
                            : '${trainer.dob?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Email Id',
                        subText: trainer.email == null || trainer.email == ''
                            ? 'Not Provided'
                            : '${trainer.email}',
                      ),
                      TitledText(
                        title: 'Area Of Expertise',
                        subText:
                            trainer.expertise == null || trainer.expertise == ''
                                ? 'Not Provided'
                                : '${trainer.expertise}',
                      ),
                      TitledText(
                        title: 'Address',
                        subText:
                            trainer.address == null || trainer.address == ''
                                ? 'Not Provided'
                                : '${trainer.address}',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'ID Proof Images Max Of 2 Nos.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          DocumentImage(
                            imageUrl:
                                '${F.baseUrl}/admin/documents/trainer/${trainer.id}/${trainer.document1}',
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          DocumentImage(
                            imageUrl:
                                '${F.baseUrl}/admin/documents/trainer/${trainer.id}/${trainer.document2}',
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
                            subText: trainer.upiId ?? 'UPI Not Added',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                EditSalaryTrainer.route,
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
                        subText: '${trainer.salaryDate}',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Amount',
                        titleColor: Colors.white,
                        subText:
                            'Rs. ${trainer.salaryAmount?.toString().currencyFormat()}/-',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TitledText(
                        title: 'Joining Date',
                        titleColor: Colors.white,
                        subText: '${trainer.doj?.toDDMMYYY()}',
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
