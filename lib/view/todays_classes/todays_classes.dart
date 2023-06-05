import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/todays_classes/components/todays_class_list.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/todays_classes/classes_today_cubit.dart';

class TodaysClasses extends StatefulWidget {
  static const route = '/todays_classes';

  const TodaysClasses({Key? key}) : super(key: key);

  @override
  State<TodaysClasses> createState() => _TodaysClassesState();
}

class _TodaysClassesState extends State<TodaysClasses> {
  @override
  void initState() {
    super.initState();
    context.read<ClassesTodayCubit>().getClassesToday();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ClassesTodayCubit>();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return Scaffold(
      appBar: const CommonBar(
        title: 'Today\'s Classes',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    formattedDate.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    BlocBuilder<ClassesTodayCubit, ClassesTodayState>(
                      builder: (context, state) {
                        if (state is FetchingClassesToday) {
                          return const Padding(
                            padding: EdgeInsets.all(64.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (cubit.classes?.length == 0) {
                          return const Padding(
                            padding: EdgeInsets.all(64.0),
                            child: Center(
                              child: Text('Sorry, No Matching Results Found.'),
                            ),
                          );
                        }
                        return TodaysClassList(
                          classesList: cubit.classes ?? [],
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
