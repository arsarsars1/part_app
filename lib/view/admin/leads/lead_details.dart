import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/admin/leads/edit_lead.dart';
import 'package:part_app/view/admin/leads/lead_follow_up_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadDetails extends StatefulWidget {
  static const route = '/leads/details';
  const LeadDetails({super.key});

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  @override
  void initState() {
    var cubit = context.read<LeadsCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.getLeadById(id: "${cubit.selectedLead?.id}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LeadsCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Lead Details'),
      body: BlocConsumer<LeadsCubit, LeadsState>(
        listener: (context, state) {
          if (state is FetchingLeadFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is FetchingLead) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfilePicture(
                      showEdit: false,
                      imageUrl: cubit.lead?.profilePic != "" &&
                              cubit.lead?.profilePic != null
                          ? '${F.baseUrl}/admin/images/lead/${cubit.lead?.id}'
                              '/${cubit.lead?.profilePic}'
                          : cubit.lead?.gender == "male"
                              ? "https://v1.partapp.in/images/avatars/avatar-5.png"
                              : "https://v1.partapp.in/images/avatars/avatar-1.png",
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
                      cubit.lead?.name ?? "Not Available",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Center(
                    child: Text(
                      cubit.lead?.leadStatus ?? "Not Available",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Assigned To:   ',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                      Text(
                        cubit.lead?.assignedTo?.name ?? "Not Available",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Launchers(
                    phoneNo: cubit.lead?.mobileNo ?? "",
                    whatsappNo: cubit.lead?.whatsapp ?? "",
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
                              subText:
                                  cubit.lead?.leadStatus ?? "Not Available",
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.selectedLead = cubit.lead;
                                Navigator.pushNamed(context, EditLead.route);
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
                          title: 'Mobile No *',
                          subText: cubit.lead?.mobileNo ?? "Not Available",
                        ),
                        if (cubit.lead?.whatsapp != null)
                          TitledText(
                            title: 'Whatsapp No',
                            subText:
                                '${cubit.lead?.whatsapp ?? "Not Available"}',
                          ),
                        TitledText(
                          title: 'Age',
                          subText: cubit.lead?.age ?? "Not Available",
                        ),

                        TitledText(
                          title: 'Gender',
                          subText: cubit.lead?.gender ?? "Not Available",
                        ),
                        // TitledText(
                        //   title: 'Email Id',
                        //   subText: '${cubit.lead?}',
                        // ),
                        TitledText(
                          title: 'Branch',
                          subText:
                              cubit.lead?.branch?.branchName ?? "Not Available",
                        ),
                        TitledText(
                          title: 'Batch',
                          subText:
                              cubit.lead?.batch?.batchName ?? "Not Available",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
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
                      Center(
                        child: Button(
                          height: 35.h,
                          onTap: () {
                            cubit.selectedFollowUp = null;
                            Navigator.pushNamed(
                                context, LeadFollowUpDetails.route);
                          },
                          title: 'Add New FollowUp',
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ((cubit.lead?.followUps ?? []).isEmpty)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'No follow up available',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cubit.lead?.followUps?.length,
                              itemBuilder: (context, index) {
                                FollowUp? followup =
                                    cubit.lead?.followUps?[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.liteDark,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Follow Up Date And Time',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: AppColors
                                                            .primaryColor,
                                                        fontSize: 12,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                    '${followup?.followUpDate?.toDDMMMYYY()}, ${followup?.followUpTime?.toAmPM()}'),
                                              ],
                                            ),
                                            // TitledText(
                                            //   title: 'Follow Up Date And Time',
                                            //   subText:
                                            //       '${followup?.followUpDate?.toDDMMMYYY()}, ${followup?.followUpTime?.toAmPM()}',
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                cubit.selectedFollowUp =
                                                    followup;
                                                Navigator.pushNamed(context,
                                                    LeadFollowUpDetails.route);
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
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Followup Status:  ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(),
                                            ),
                                            Text(
                                                followup?.followUpStatus ??
                                                    "Not Available"
                                                // == 'Pending'
                                                // ? 'Upcoming'
                                                // : 'Completed'
                                                ,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                // ?.copyWith(
                                                //   color: followup
                                                //               ?.followUpStatus ==
                                                //           'Pending'
                                                //       ? AppColors.primaryColor
                                                //       : AppColors.green,
                                                // ),
                                                ),
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                        TitledText(
                                          title: 'Assigned to',
                                          subText: followup?.assignedTo?.name ??
                                              'No Comment Added',
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
          );
        },
      ),
    );
  }
}
