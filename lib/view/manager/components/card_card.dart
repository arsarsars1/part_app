import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/view/components/launcher.dart';
import 'package:part_app/view/constants/constant.dart';

class ManagerCard extends StatelessWidget {
  final VoidCallback onSelect;
  final Manager manager;

  const ManagerCard({Key? key, required this.onSelect, required this.manager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
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
                      image: manager.profilePic != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://dev.partapp.in/images/trainers/${manager.profilePic}'),
                            )
                          : null,
                    ),
                    padding: EdgeInsets.all(12.r),
                    child: manager.profilePic == null
                        ? SvgPicture.asset(
                            Assets.trainerListIcon,
                          )
                        : null,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      '${manager.user?.name}',
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
                      if (manager.whatsappNo != null) {
                        Launcher.openWhatsapp(
                          context: context,
                          text: '',
                          number:
                              '+${manager.user?.countryCode}${manager.whatsappNo}',
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
                      if (manager.user?.mobileNo != null) {
                        Launcher.makePhoneCall(
                          '+${manager.user?.countryCode}${manager.user?.mobileNo}',
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
  }
}
