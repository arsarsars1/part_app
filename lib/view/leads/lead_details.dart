import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadDetails extends StatefulWidget {
  static const route = '/leads/details';
  const LeadDetails({Key? key}) : super(key: key);

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LeadsCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Lead Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProfilePicture(
                  imageUrl: cubit.selectedLead?.profilePic != "" &&
                          cubit.selectedLead?.profilePic != null
                      ? '${F.baseUrl}/admin/images/lead/${cubit.selectedLead?.id}'
                          '/${cubit.selectedLead?.profilePic}'
                      : cubit.selectedLead?.gender == "male"
                          ? "https://dev.partapp.in/images/avatars/avatar-5.png"
                          : "https://dev.partapp.in/images/avatars/avatar-1.png",
                  onEdit: () {},
                  onAvatar: (File value) {},
                  onChange: (File value) {},
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text(
                  '${cubit.selectedLead?.name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Launchers(
                phoneNo: '+',
                whatsappNo: '',
                email: '',
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitledText(
                          title: 'Status *',
                          subText: '${cubit.selectedLead?.leadStatus}',
                        ),
                        GestureDetector(
                          onTap: () {},
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
                      subText: '${cubit.selectedLead?.mobileNo}',
                    ),
                    if (cubit.selectedLead?.whatsapp != null)
                      TitledText(
                        title: 'Whatsapp No',
                        subText: '${cubit.selectedLead?.whatsapp}',
                      ),
                    TitledText(
                      title: 'Age',
                      subText: '${cubit.selectedLead?.age}',
                    ),

                    TitledText(
                      title: 'Gender',
                      subText: '${cubit.selectedLead?.gender}',
                    ),
                    // TitledText(
                    //   title: 'Email Id',
                    //   subText: '${cubit.selectedLead?}',
                    // ),
                    TitledText(
                      title: 'Branch',
                      subText: '${cubit.selectedLead?.branch?.branchName}',
                    ),
                    TitledText(
                      title: 'Batch',
                      subText: '${cubit.selectedLead?.batch?.batchName}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              if ((cubit.selectedLead?.followUps ?? []).isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Follow up Details',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.selectedLead?.followUps?.length,
                      itemBuilder: (context, index) {
                        FollowUp? followup =
                            cubit.selectedLead?.followUps?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.liteDark,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TitledText(
                                      title: 'Follow Up Date And Time',
                                      subText:
                                          '${followup?.followUpDate?.toDDMMMYYY()}, ${followup?.followUpTime?.toAmPM()}',
                                    ),
                                    GestureDetector(
                                      onTap: () {},
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
                                Row(
                                  children: [
                                    Text(
                                      'Followup Status:  ',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                    Text(
                                      followup?.followUpStatus == 'Pending'
                                          ? 'Upcoming'
                                          : 'Completed',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: followup?.followUpStatus ==
                                                    'Pending'
                                                ? AppColors.primaryColor
                                                : AppColors.green,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                TitledText(
                                  title: 'Comments',
                                  subText:
                                      '${followup?.followUpComment ?? 'No Comment Added'}',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
