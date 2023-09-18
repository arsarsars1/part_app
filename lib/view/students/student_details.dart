import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/fee/student_admission_fee_details.dart';
import 'package:part_app/view/fee/student_fee_details.dart';
import 'package:part_app/view/students/edit_student.dart';
import 'package:part_app/view/students/edit_student_batches.dart';
import 'package:part_app/view/students/student_attendence.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentDetails extends StatefulWidget {
  static const route = '/student/details';

  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Student Profile'),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          Student? student = context.read<StudentCubit>().student;
          StudentDetail? details = student?.studentDetail![0];
          if (student != null) {
            return ListView(
              children: [
                Center(
                  child: ProfilePicture(
                    imageUrl: details?.profilePic != ""
                        ? '${F.baseUrl}/admin/images/student/${details?.id}'
                            '/${details?.profilePic}'
                        : details?.gender == "male"
                            ? "https://dev.partapp.in/images/avatars/avatar-5.png"
                            : "https://dev.partapp.in/images/avatars/avatar-1.png",
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
                              Navigator.pushNamed(context, EditStudent.route);
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
                        subText: '${details?.whatsappNo}',
                      ),
                      if (details?.parentName != null)
                        TitledText(
                          title: 'Parent Name',
                          subText: '${details?.parentName}',
                        ),
                      TitledText(
                        title: 'Date Of Birth',
                        subText: '${details?.dob?.toDateString()}',
                      ),
                      TitledText(
                        title: 'Gender',
                        subText: '${details?.gender?.capitalize()}',
                      ),
                      TitledText(
                        title: 'Email Id',
                        subText: '${details?.email}',
                      ),
                      TitledText(
                        title: 'Address',
                        subText: '${details?.address}',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                LargeButton(
                  title: 'Student Batches',
                  onTap: () {
                    context.read<StudentCubit>().getStudentBatches();
                    Navigator.pushNamed(
                      context,
                      EditStudentBatches.route,
                      arguments: true,
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                LargeButton(
                  title: 'Attendence Sheet',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      StudentAttendanceCalenderView.route,
                    );
                  },
                  color: const Color(0xFFA29CF4),
                ),
                const SizedBox(
                  height: 16,
                ),
                LargeButton(
                  title: 'Fee Details',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      StudentFeeDetails.route,
                    );
                  },
                  color: AppColors.defaultBlue,
                ),
                const SizedBox(
                  height: 16,
                ),
                LargeButton(
                  title: 'Admission Fee Details',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      StudentAdmissionFeeDetails.route,
                    );
                  },
                  color: AppColors.defaultBlue,
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
