import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class BatchItem extends StatelessWidget {
  final BatchModel batch;
  final VoidCallback onTap;
  final bool hideTrainer;
  final bool reschedule;
  final bool addBatch;
  final VoidCallback? onAddToBatch;

  const BatchItem({
    Key? key,
    required this.batch,
    required this.onTap,
    this.hideTrainer = false,
    this.reschedule = false,
    this.addBatch = false,
    this.onAddToBatch,
  })  : assert(
          onAddToBatch != null && addBatch,
          'Add batch requires the onAddToBatch',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          if (!reschedule)
                            Text(
                              'Active Students: ${batch.studentCount ?? 0}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
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
                            batch.branchName,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
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
                if (addBatch)
                  Button(
                    height: 26.h,
                    width: 100.w,
                    onTap: onAddToBatch,
                    title: 'Add To Batch',
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
                            Theme.of(context).textTheme.bodyText1?.copyWith(),
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
                                  .bodyText1
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (!reschedule)
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                );
              },
              itemCount: batch.days.length,
            ),
            if (addBatch)
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Admission Fees: ${batch.admissionFee.toString().currencyFormat()}/-',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Fees: ${batch.fee.toString().currencyFormat()}/-',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
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
