import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/leads/edit_lead.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class LeadDetails extends StatefulWidget {
  static const route = '/leads/details';
  const LeadDetails({Key? key}) : super(key: key);

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
      appBar: const CommonBar(
        title: 'Lead Details',
      ),
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
                      '${cubit.lead?.name} *',
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
                      '${cubit.lead?.leadStatus}',
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
                        '${cubit.lead?.assignedTo?.name}',
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
                    phoneNo: '${cubit.lead?.mobileNo}',
                    whatsappNo: '${cubit.lead?.whatsapp}',
                    email: 'test@test.com',
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
                              subText: '${cubit.lead?.leadStatus}',
                            ),
                            GestureDetector(
                              onTap: () {
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
                          subText: '${cubit.lead?.mobileNo}',
                        ),
                        if (cubit.lead?.whatsapp != null)
                          TitledText(
                            title: 'Whatsapp No',
                            subText: '${cubit.lead?.whatsapp}',
                          ),
                        TitledText(
                          title: 'Age',
                          subText: '${cubit.lead?.age}',
                        ),

                        TitledText(
                          title: 'Gender',
                          subText: '${cubit.lead?.gender}',
                        ),
                        // TitledText(
                        //   title: 'Email Id',
                        //   subText: '${cubit.lead?}',
                        // ),
                        TitledText(
                          title: 'Branch',
                          subText: '${cubit.lead?.branch?.branchName}',
                        ),
                        TitledText(
                          title: 'Batch',
                          subText: '${cubit.lead?.batch?.batchName}',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  if ((cubit.lead?.followUps ?? []).isNotEmpty)
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
                            onTap: () {},
                            title: 'Add New FollowUp',
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.lead?.followUps?.length,
                          itemBuilder: (context, index) {
                            FollowUp? followup = cubit.lead?.followUps?[index];
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
                                                    color:
                                                        AppColors.primaryColor,
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
                                          followup?.followUpStatus == 'Pending'
                                              ? 'Upcoming'
                                              : 'Completed',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color:
                                                    followup?.followUpStatus ==
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
          );
        },
      ),
    );
  }
}
