import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/fee/trainer_app_student_admission_fee_details.dart';
import 'package:part_app/view/fee/trainer_app_student_fee_details.dart';
import 'package:part_app/view/students/trainer_app_edit_student.dart';
import 'package:part_app/view/students/trainer_app_edit_student_batches.dart';
import 'package:part_app/view/students/trainer_app_student_attendence.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppStudentDetails extends StatefulWidget {
  static const route = '/trainer-app-student/details';

  const TrainerAppStudentDetails({super.key});

  @override
  State<TrainerAppStudentDetails> createState() =>
      _TrainerAppStudentDetailsState();
}

class _TrainerAppStudentDetailsState extends State<TrainerAppStudentDetails> {
  bool active = true;
  AuthCubit? authCubit;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Student Profile'),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          Student? student = context.read<StudentCubit>().student;
          StudentDetail? details = student?.studentDetail![0];
          if (state is StudentDetailsFetching) {
            return const LoadingView(hideColor: true);
          }
          if (student != null) {
            return ListView(
              children: [
                Center(
                  child: ProfilePicture(
                    imageUrl: details?.profilePic != ""
                        ? '${F.baseUrl}/admin/images/student/${details?.id}'
                            '/${details?.profilePic}'
                        : details?.gender == "male"
                            ? "https://v1.partapp.in/images/avatars/avatar-5.png"
                            : "https://v1.partapp.in/images/avatars/avatar-1.png",
                    onEdit: () {},
                    onAvatar: (File value) {},
                    onChange: (File value) {
                      context
                          .read<StudentCubit>()
                          .updateProfilePic(profilePic: value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${details?.name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Launchers(
                  phoneNo: '+${student.countryCode}${student.mobileNo}',
                  whatsappNo: '+${student.countryCode}${details?.whatsappNo}',
                  email: '${details?.email}',
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
                            title: 'Mobile No',
                            subText: '${student.mobileNo}',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TrainerAppEditStudent.route);
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
                        title: 'Whatsapp No',
                        subText: details?.whatsappNo == null ||
                                details?.whatsappNo == '0'
                            ? 'Not Provided'
                            : '${details?.whatsappNo}',
                      ),
                      if (details?.parentName != null)
                        TitledText(
                          title: 'Parent Name',
                          subText: details?.parentName == null ||
                                  details?.parentName == ''
                              ? 'Not Provided'
                              : '${details?.parentName}',
                        ),
                      TitledText(
                        title: 'Date Of Birth',
                        subText: details?.dob == null
                            ? 'Not Provided'
                            : '${details?.dob?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Date Of Joining',
                        subText: details?.doj == null
                            ? 'Not Provided'
                            : '${details?.doj?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Gender',
                        subText: '${details?.gender?.capitalize()}',
                      ),
                      TitledText(
                        title: 'Email Id',
                        subText: details?.email == null || details?.email == ''
                            ? 'Not Provided'
                            : '${details?.email}',
                      ),
                      TitledText(
                        title: 'Address',
                        subText:
                            details?.address == null || details?.address == ''
                                ? 'Not Provided'
                                : '${details?.address}',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    LargeButton(
                      title: 'Student Batches',
                      marginPadding: UIConstants.largeLeftButtonMargin,
                      onTap: () {
                        context
                            .read<StudentCubit>()
                            .getStudentBatchesForTrainer(
                              trainerId: authCubit
                                      ?.user
                                      ?.trainerDetail?[
                                          authCubit?.trainerIndex ?? 0]
                                      .id ??
                                  0,
                            );
                        Navigator.pushNamed(
                          context,
                          TrainerAppEditStudentBatches.route,
                          arguments: true,
                        );
                      },
                    ).expanded(shouldExpand: true),
                    const SizedBox(
                      height: 16,
                    ),
                    LargeButton(
                      title: 'Attendance Sheet',
                      marginPadding: UIConstants.largeRightButtonMargin,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TrainerAppStudentAttendanceCalenderView.route,
                        );
                      },
                      color: const Color(0xFFA29CF4),
                    ).expanded(shouldExpand: true),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    LargeButton(
                      title: 'Fee Details',
                      marginPadding: UIConstants.largeLeftButtonMargin,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TrainerAppStudentFeeDetails.route,
                        );
                      },
                      color: AppColors.defaultBlue,
                    ).expanded(shouldExpand: true),
                    const SizedBox(
                      height: 16,
                    ),
                    LargeButton(
                      title: 'Admission Fee Details',
                      marginPadding: UIConstants.largeRightButtonMargin,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TrainerAppStudentAdmissionFeeDetails.route,
                        );
                      },
                      color: AppColors.defaultBlue,
                    ).expanded(shouldExpand: true),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                // LargeButton(
                //   title: 'Other Payments',
                //   onTap: () {},
                //   color: AppColors.defaultBlue,
                // ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
