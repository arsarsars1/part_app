import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/cancel_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/batch/manager_app_cancel_batch_class.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/home/manager_app_home.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppCancelledClasses extends StatefulWidget {
  static const route = '/manager-app-batch/cancelled-classes';

  const ManagerAppCancelledClasses({super.key});

  @override
  State<ManagerAppCancelledClasses> createState() =>
      ManagerAppCancelledClassesState();
}

class ManagerAppCancelledClassesState
    extends State<ManagerAppCancelledClasses> {
  AuthCubit? authCubit;
  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BatchCubit>().getCancelledBatchesForManager(
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
          title: 'Cancelled Classes',
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
                  height: UIConstants.buttonHeight,
                  onTap: () => Navigator.pushNamed(
                    context,
                    ManagerAppCancelClass.route,
                  ),
                  title: 'Cancel Class',
                ),
              ),
            ),
            ScheduleField(
              title: 'Month, Year',
              hint: 'Select month & year',
              initialValue: DateTime.now().toMMMMYYYY(),
              dateMonth: true,
              onDateSelect: (DateTime value) {
                context.read<BatchCubit>().getCancelledBatchesForManager(
                    managerId: authCubit?.user
                            ?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                        0,
                    month: value.month,
                    year: value.year);
              },
              time: false,
              onlyMonth: true,
            ),
            BlocBuilder<BatchCubit, BatchState>(
              builder: (context, state) {
                if (state is CancelledListFetching) {
                  return const Expanded(child: LoadingView());
                }

                if (cubit.cancelledList!.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text('No classes cancelled.'),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.cancelledList!.length,
                    itemBuilder: (context, index) {
                      CancelledClass detail = cubit.cancelledList![index];
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Cancelled Class',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (detail.classDate!
                                        .isBefore(DateTime.now())) {
                                      Alert(context).show(
                                        message:
                                            'Past date cannot be cancelled.',
                                      );
                                    } else {
                                      CommonDialog(
                                        context: context,
                                        message:
                                            'Do you want to delete the cancelled class on,',
                                        buttonText: 'Yes',
                                        subColor: AppColors.primaryColor,
                                        subContent: Column(
                                          children: [
                                            Text(
                                              'Date : ${detail.classDate?.formattedString()} '
                                              '\nTime : ${detail.startTime?.toAmPM()} - '
                                              '${detail.endTime?.toAmPM()} ?',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                            ),
                                            const Text(
                                              'Note: Students and Trainers will be \nnotified.',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          context
                                              .read<BatchCubit>()
                                              .deleteClassCancellationForManager(
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
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Reason : ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Text(
                                    '${detail.reason} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${detail.classDate?.toDateString()} ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${detail.startTime?.toAmPM()} - '
                                  '${detail.endTime?.toAmPM()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
