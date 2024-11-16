import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/todays_classes/components/todays_class_list.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/todays_classes/classes_today_cubit.dart';

class ManagerAppTodaysClasses extends StatefulWidget {
  static const route = '/manager-app-todays_classes';

  const ManagerAppTodaysClasses({super.key});

  @override
  State<ManagerAppTodaysClasses> createState() =>
      _ManagerAppTodaysClassesState();
}

class _ManagerAppTodaysClassesState extends State<ManagerAppTodaysClasses> {
  AuthCubit? authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ClassesTodayCubit>();
    DateTime now = DateTime.now();
    DateFormat apiDateFormat = DateFormat("yyyy-MM-dd");
    String formattedDateTime = apiDateFormat.format(now);
    cubit.getClassesTodayForManager(
      date: formattedDateTime,
      managerId:
          authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ?? 0,
    );
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
                    style: Theme.of(context).textTheme.bodyLarge,
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
                        if ((cubit.classes ?? []).isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(64.0),
                            child: Center(
                              child:
                                  Text('Sorry, No class is scheduled today.'),
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
