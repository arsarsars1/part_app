import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';
import '../../../flavors.dart';
import '../../components/user_image.dart';

class AttendanceUpdateListItem extends StatefulWidget {
  final List<Trainer> trainers;
  final ValueChanged<Trainer> onSelect;

  const AttendanceUpdateListItem({Key? key, required this.trainers, required this.onSelect})
      : super(key: key);

  @override
  State<AttendanceUpdateListItem> createState() => _AttendanceUpdateListItemState();
}

class _AttendanceUpdateListItemState extends State<AttendanceUpdateListItem> {
  late ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
            
        context.read<TrainerCubit>().getRestOfTheTrainers(nextPage: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var token = 'Bearer ${Database().getToken()}';

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.trainers.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        Trainer trainer = widget.trainers[index].trainerDetail![0];
        return InkWell(
          onTap: () {
            // call back to parent widget
            widget.onSelect(trainer);
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
                      UserImage(
                        profilePic: trainer.profilePic != ""
                            ? '${F.baseUrl}'
                            '/admin/images/trainer/'
                            '${trainer.id}/${trainer.profilePic}'
                            : '',
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
                      Container(
                        height: 25.0.h,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            trackColor: AppColors.grey500,
                            value: trainer?.isActive == 1,
                            onChanged: (value) {

                            },
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
}
