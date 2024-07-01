import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/student_app_batch_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view_model/batch/batch_cubit.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';

class StudentAppBatchItem extends StatelessWidget {
  final StudentAppBatchDetail batch;
  final VoidCallback onTap;
  final bool hideTrainer;
  final bool reschedule;
  final bool addBatch;
  final VoidCallback? onAddToBatch;
  final bool enrolled;

  final bool edit;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const StudentAppBatchItem({
    super.key,
    required this.batch,
    required this.onTap,
    this.hideTrainer = false,
    this.reschedule = false,
    this.addBatch = false,
    this.edit = false,
    this.enrolled = false,
    this.onAddToBatch,
    this.onEdit,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    String branchName = '';
    for (var item in context.read<BranchCubit>().branches) {
      if (item.id == batch.branchId) {
        branchName = item.branchName ?? "";
        break;
      }
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.liteDark,
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              batch.batchName ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            batch.branch?.branchName == 'Branch Not Allocated'
                                ? branchName
                                : batch.branch?.branchName ?? "",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (addBatch && !enrolled)
                  Button(
                    height: 26.h,
                    width: 100.w,
                    onTap: onAddToBatch,
                    title: 'Add To Batch',
                  ),
                if (enrolled)
                  Text(
                    'Enrolled',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.green,
                        ),
                  ),
                if (edit)
                  Row(
                    children: [
                      RoundButton(
                        edit: false,
                        onTap: onRemove!,
                      ),
                      // const SizedBox(
                      //   width: 16,
                      // ),
                      // RoundButton(
                      //   onTap: onEdit!,
                      // ),
                    ],
                  )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${batch.course?.courseName}, ${batch.subject?.subjectName}',
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      if (!hideTrainer)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trainer - ${context.read<BatchCubit>().createTrainerStringFromTrainer(batch.trainers)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(
                  context
                      .read<BatchCubit>()
                      .createDayList(batch.batchDetail)[index],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                );
              },
              itemCount: context
                  .read<BatchCubit>()
                  .createDayList(batch.batchDetail)
                  .length,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Admission Fees: ₹${batch.admissionFees.toString().currencyFormat()}/-',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  ),
                ),
                if (batch.students?[0].feeType != null)
                  Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: batch.students?[0].feeType == "monthly"
                            ? Text(
                                'Monthly',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                              )
                            : Text(
                                'Class Based : ${batch.students?[0].noOfClasses} Nos.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.bold),
                              ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Fees: ₹${batch.feeAmount.toString().currencyFormat()}/-',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
