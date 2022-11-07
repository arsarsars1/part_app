import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainerList extends StatelessWidget {
  final List<Trainer> trainers;
  final ValueChanged<Trainer> onSelect;

  const TrainerList({Key? key, required this.trainers, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: trainers.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Trainer trainer = trainers[index];
        return InkWell(
          onTap: () {
            // call back to parent widget
            onSelect(trainer);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.liteDark,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF0575E6),
                              Color(0xFF640078),
                            ],
                          ),
                          image: trainer.profilePic != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://dev.partapp.in/images/trainers/${trainer.profilePic}'),
                                )
                              : null,
                        ),
                        padding: EdgeInsets.all(12.r),
                        child: trainer.profilePic == null
                            ? SvgPicture.asset(
                                Assets.trainerListIcon,
                              )
                            : null,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          '${trainer.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (trainer.whatsappNo != null) {
                            openWhatsapp(
                              context: context,
                              text: '',
                              number:
                                  '+${trainer.user?.countryCode}${trainer.whatsappNo}',
                            );
                          }
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00F260),
                          ),
                          child: SvgPicture.asset(
                            Assets.whatsApp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          if (trainer.user?.mobileNo != null) {
                            _makePhoneCall(
                              '+${trainer.user?.countryCode}${trainer.user?.mobileNo}',
                              context,
                            );
                          }
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF0072FF),
                          ),
                          child: SvgPicture.asset(
                            Assets.phone,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _makePhoneCall(String phoneNumber, BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      Alert(context).show(message: 'Phone not available');
    }
  }

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        Alert(context).show(message: "Whatsapp not installed");
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        Alert(context).show(message: "Whatsapp not installed");
      }
    }
  }
}
