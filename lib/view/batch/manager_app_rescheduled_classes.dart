import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/reschedule_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/manager_app_reschedule_class.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/manager_app_home.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppRescheduledClasses extends StatefulWidget {
  static const route = '/manager-app-batch/rescheduled-classes';

  const ManagerAppRescheduledClasses({super.key});

  @override
  State<ManagerAppRescheduledClasses> createState() =>
      _ManagerAppRescheduledClassesState();
}

class _ManagerAppRescheduledClassesState
    extends State<ManagerAppRescheduledClasses> {
  AuthCubit? authCubit;
  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BatchCubit>().getRescheduledBatchesForManager(
            managerId: authCubit
                    ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return WillPopScope(
      onWillPop: () async {
        if (cubit.second) {
          cubit.second = false;
          Navigator.pushNamedAndRemoveUntil(
            context,
            ManagerAppHome.route,
            (route) => false,
          );
        } else {
          Navigator.pop(context);
        }
        return false;
      },
      child: Scaffold(
        appBar: CommonBar(
          title: 'Rescheduled Classes',
          onPressed: () {
            if (cubit.second) {
              cubit.second = false;
              Navigator.pushNamedAndRemoveUntil(
                context,
                ManagerAppHome.route,
                (route) => false,
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    height: UIConstants.buttonHeight,
                    onTap: () => Navigator.pushNamed(
                      context,
                      ManagerAppRescheduleClass.route,
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
                  context.read<BatchCubit>().getRescheduledBatchesForManager(
                      managerId: authCubit
                              ?.user
                              ?.managerDetail?[authCubit?.managerIndex ?? 0]
                              .id ??
                          0,
                      month: value.month,
                      year: value.year);
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
                      RescheduledClass detail = cubit.rescheduledList[index];
                      return Opacity(
                        opacity: (detail.newDate!.isBefore(DateTime.now()) &&
                                    "${detail.newDate!.day}-${detail.newDate!.month}-${detail.newDate!.year}" !=
                                        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}") ||
                                detail.cancelledDate != null
                            ? 0.50
                            : 1,
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
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${detail.oldDate?.toDateString()} ${detail.oldDate?.formattedDay2()} '
                                      '${detail.oldStartTime?.toAmPM()} - '
                                      '${detail.oldEndTime?.toAmPM()}',
                                    ),
                                    const Text(
                                      'to',
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${detail.newDate?.toDateString()} ${detail.newDate?.formattedDay2()} '
                                      '${detail.newStartTime?.toAmPM()} - '
                                      '${detail.newEndTime?.toAmPM()}',
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if ((detail.newDate!
                                                  .isBefore(DateTime.now()) &&
                                              "${detail.newDate!.day}-${detail.newDate!.month}-${detail.newDate!.year}" !=
                                                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}") ||
                                          detail.cancelledDate != null) {
                                        if (detail.cancelledDate != null) {
                                          Alert(context).show(
                                            message:
                                                'Cancelled class cannot be changed.',
                                          );
                                        } else {
                                          Alert(context).show(
                                            message:
                                                'Past date cannot be rescheduled.',
                                          );
                                        }
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
                                                'Date: ${detail.newDate?.formattedString()} '
                                                '\nTime: ${detail.newStartTime?.toAmPM()} - '
                                                '${detail.newEndTime?.toAmPM()}',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                              ),
                                              const Text(
                                                'to',
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Date: ${detail.oldDate?.formattedString()} '
                                                '\nTime: ${detail.oldStartTime?.toAmPM()} - '
                                                '${detail.oldEndTime?.toAmPM()} ?',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              const Text(
                                                'Note: Students and Trainers will be \nnotified.\n',
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            context
                                                .read<BatchCubit>()
                                                .deactivateClassForManager(
                                                  detail.id,
                                                  authCubit
                                                          ?.user
                                                          ?.managerDetail?[authCubit
                                                                  ?.managerIndex ??
                                                              0]
                                                          .id ??
                                                      0,
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
                                  SizedBox(
                                    height: UIConstants.buttonHeight,
                                  ),
                                  if (detail.cancelledDate != null)
                                    Text(
                                      'Cancelled',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    )
                                  else if (detail.newDate!
                                          .isBefore(DateTime.now()) &&
                                      "${detail.newDate!.day}-${detail.newDate!.month}-${detail.newDate!.year}" !=
                                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}")
                                    Text(
                                      'Expired',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.grey100,
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
