import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../flavors.dart';
import '../../../model/data_model/ClassesToday.dart';
import '../../components/user_image.dart';

class TodaysClassList extends StatefulWidget {
  final List<Class> classesList;

  const TodaysClassList({Key? key, required this.classesList})
      : super(key: key);

  @override
  State<TodaysClassList> createState() => _TodaysClassListState();
}

class _TodaysClassListState extends State<TodaysClassList> {
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
    String classStatus = "";
    Color color;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.classesList.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        Class classItem = widget.classesList[index];
        if (classItem.conducted == true) {
          classStatus = "Completed";
          color = AppColors.green;
        } else {
          classStatus = "Upnext";
          color = AppColors.defaultBlue;
        }

        return InkWell(
          onTap: () {
            // call back to parent widget
            // widget.onSelect();
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
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${classItem.batchName}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '${classItem.branchName}',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${classItem.trainers}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      classItem.classLink == "" ? '' : 'Online Class',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.yellow,
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${classItem.startTime} . - ${classItem.endTime}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      classStatus,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
