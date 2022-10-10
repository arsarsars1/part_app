import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/home/components/profile_button.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'part',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 48.sm,
                        ),
                  ),
                  TextSpan(
                    text: 'app.in',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 24.sm,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const ProfileButton(),
            SizedBox(
              width: 16.w,
            ),
            Stack(
              children: [
                Container(
                  height: 36.r,
                  width: 36.r,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      color: const Color(0xFFECECEC),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.notification,
                            semanticsLabel: 'Notification Logo',
                            height: 18.h,
                            width: 18.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 12.r,
                      width: 12.r,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Rock Academy of Dance',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: AppColors.primaryColor,
                fontSize: 18.sm,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          DateTime.now().toEEMMDD(),
        ),
      ],
    );
  }
}
