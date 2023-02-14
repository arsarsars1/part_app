import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class LeadDetails extends StatefulWidget {
  static const route = '/leads/details';
  const LeadDetails({Key? key}) : super(key: key);

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Lead Details',
      ),
      body: Column(
        children: [
          Center(
            child: ProfilePicture(
              imageUrl: '',
              onEdit: () {},
              onChange: (File value) {},
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Sriram',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Launchers(
            phoneNo: '+',
            whatsappNo: '',
            email: '',
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
                      title: 'Lead Status',
                      subText: 'student.mobileNo}',
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
                  subText: 'details?.whatsappNo}',
                ),
                TitledText(
                  title: 'Whatsapp No',
                  subText: 'details?.whatsappNo}',
                ),
                TitledText(
                  title: 'Age',
                  subText: 'details?.whatsappNo}',
                ),
                TitledText(
                  title: 'Date Of Birth',
                  subText: 'details?.dob?.toDateString()}',
                ),
                TitledText(
                  title: 'Gender',
                  subText: 'details?.gender?.capitalize()}',
                ),
                TitledText(
                  title: 'Email Id',
                  subText: 'details?.gender?.capitalize()}',
                ),
                TitledText(
                  title: 'Branch',
                  subText: 'details?.email}',
                ),
                TitledText(
                  title: 'Batch',
                  subText: 'details?.address}',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
