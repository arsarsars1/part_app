import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/constants/constant.dart';

class TrainerList extends StatelessWidget {
  final List<Trainer> trainers;

  const TrainerList({Key? key, required this.trainers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: trainers.length ?? 0,
      itemBuilder: (context, index) {
        Trainer trainer = trainers[index];
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
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
                      ),
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset(
                        Assets.trainerListIcon,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      trainer.user?.name ?? 'NA',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00F260),
                      ),
                      child: SvgPicture.asset(
                        Assets.whatsApp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 25,
                      height: 25,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0072FF),
                      ),
                      child: SvgPicture.asset(
                        Assets.phone,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
