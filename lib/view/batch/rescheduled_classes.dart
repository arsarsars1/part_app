import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/reschedule_class.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class RescheduledClasses extends StatefulWidget {
  static const route = '/batch/rescheduled-classes';

  const RescheduledClasses({Key? key}) : super(key: key);

  @override
  State<RescheduledClasses> createState() => _RescheduledClassesState();
}

class _RescheduledClassesState extends State<RescheduledClasses> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BatchCubit>().getRescheduledBatches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Rescheduled Classes',
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
              ),
              child: Button(
                height: 30.h,
                onTap: () => Navigator.pushNamed(
                  context,
                  RescheduleClass.route,
                ),
                title: 'Reschedule Class',
              ),
            ),
          ),
          ScheduleField(
            title: 'Month, Year',
            hint: 'Select month & year',
            initialValue: DateTime.now().toMMMMYYYY(),
            dateMonth: true,
            onDateSelect: (DateTime value) {
              context
                  .read<BatchCubit>()
                  .getRescheduledBatches(month: value.month, year: value.year);
            },
            time: false,
            onlyMonth: true,
          ),
          BlocBuilder<BatchCubit, BatchState>(
            builder: (context, state) {
              if (state is RescheduledListFetching) {
                return const Expanded(child: LoadingView());
              }

              if (cubit.rescheduledList.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text('No classes rescheduled.'),
                  ),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.rescheduledList.length,
                itemBuilder: (context, index) {
                  BatchDetail detail = cubit.rescheduledList[index];
                  return Opacity(
                    opacity:
                        detail.newDate!.isBefore(DateTime.now()) ? 0.50 : 1,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rescheduled From',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${detail.previousDate?.formattedDay()} '
                                  '${detail.startTime?.toAmPM()} - '
                                  '${detail.endTime?.toAmPM()}',
                                ),
                                const Text(
                                  'to',
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${detail.newDate?.formattedDay()} '
                                  '${detail.startTime?.toAmPM()} - '
                                  '${detail.endTime?.toAmPM()}',
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (detail.newDate!.isBefore(DateTime.now())) {
                                Alert(context).show(
                                  message: 'Past date cannot be rescheduled.',
                                );
                              } else {
                                CommonDialog(
                                  context: context,
                                  message:
                                      'Do you want to delete the rescheduled class,'
                                      ' it will be restored to its scheduled date',
                                  buttonText: 'Yes',
                                  subColor: AppColors.primaryColor,
                                  subContent: Column(
                                    children: [
                                      Text(
                                        'date ${detail.newDate?.formattedString()} '
                                        '\ntime ${detail.startTime?.toAmPM()} - '
                                        '${detail.endTime?.toAmPM()}',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                      const Text(
                                        'to',
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'date ${detail.previousDate?.formattedString()} '
                                        'time \n${detail.startTime?.toAmPM()} - '
                                        '${detail.endTime?.toAmPM()}',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                      const Text(
                                        '?',
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        'Not: Students and Trainers will be \nnotified.\n',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    context.read<BatchCubit>().deactivateClass(
                                          detail.id,
                                        );
                                  },
                                ).show();
                              }
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
                                Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
