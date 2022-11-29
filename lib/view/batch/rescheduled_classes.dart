import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/reschedule_class.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/batch/batch_cubit.dart';
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
    // TODO: implement initState
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
            hint: 'Select Month & Year',
            dateMonth: true,
            onDateSelect: (DateTime value) {},
            time: false,
          ),
          BlocBuilder<BatchCubit, BatchState>(
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.rescheduledList.length,
                itemBuilder: (context, index) {
                  BatchDetail detail = cubit.rescheduledList[index];
                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.liteDark,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rescheduled Class',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Rescheduled From'),
                        Text('${detail.previousDate?.formattedDay()}'),
                      ],
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
