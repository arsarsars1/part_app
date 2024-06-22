import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';

class BatchItem extends StatelessWidget {
  final BatchModel batch;
  final VoidCallback onTap;
  final bool hideTrainer;
  final bool reschedule;
  final bool addBatch;
  final VoidCallback? onAddToBatch;
  final bool enrolled;

  final bool edit;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const BatchItem({
    Key? key,
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
  }) : super(key: key);

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
                              batch.name,
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
                          if (!reschedule && !edit)
                            Text(
                              'Active Students: ${batch.studentCount ?? 0}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
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
                            batch.branchName == 'Branch Not Allocated'
                                ? branchName
                                : batch.branchName,
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
                        '${batch.courseName}, ${batch.subjectName}',
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
                              'Trainer - ${batch.trainersString}',
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
                if (!reschedule && !edit)
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(
                  batch.days[index],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                );
              },
              itemCount: batch.days.length,
            ),
            if (addBatch || edit)
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Admission Fees: ₹${batch.admissionFee.toString().currencyFormat()}/-',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                    ),
                  ),
                  if (batch.pivot?.feeType != null)
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: batch.pivot?.feeType == "monthly"
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
                                  'Class Based : ${batch.pivot?.noOfClasses.toString()} Nos.',
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
                      'Fees: ₹${batch.fee.toString().currencyFormat()}/-',
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
