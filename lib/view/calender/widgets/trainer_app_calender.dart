import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/calender/trainer_app_calender_events.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppCalender extends StatelessWidget {
  const TrainerAppCalender({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CalendarCarousel<Event>(
        childAspectRatio: 1,
        iconColor: Colors.white,
        todayBorderColor: Colors.transparent,
        onDayPressed: (date, events) async {
          cubit.selectedDate = date;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TrainerAppCalenderEvent()),
          );
        },
        daysHaveCircularBorder: true,
        showOnlyCurrentMonthDate: true,
        onLeftArrowPressed: () async {},
        onRightArrowPressed: () async {},
        weekendTextStyle: const TextStyle(
          color: Colors.white,
        ),
        daysTextStyle: const TextStyle(
          color: Colors.white,
        ),
        thisMonthDayBorderColor: Colors.transparent,
        weekFormat: false,
        weekdayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        shouldShowTransform: false,
        weekDayFormat: WeekdayFormat.narrow,
        headerTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        isScrollable: false,
        customGridViewPhysics: const NeverScrollableScrollPhysics(),
        markedDateCustomTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.blue,
        ),
        showHeader: true,
        todayTextStyle: const TextStyle(
          color: Colors.white,
        ),
        todayButtonColor: Colors.blue,
        selectedDayTextStyle: const TextStyle(
          color: Colors.white,
        ),
        prevDaysTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        inactiveDaysTextStyle: const TextStyle(
          color: Colors.tealAccent,
          fontSize: 16,
        ),
        onCalendarChanged: (DateTime date) {},
        onDayLongPressed: (DateTime date) {},
      ),
    );
  }
}
