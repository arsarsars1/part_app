import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/constants/constant.dart';

class BatchItem extends StatelessWidget {
  final BatchModel batch;
  final VoidCallback onTap;

  const BatchItem({Key? key, required this.batch, required this.onTap})
      : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  batch.name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Active Students: 10',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              batch.branchName,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '${batch.courseName}, ${batch.subjectName}',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Trainer - ${batch.trainersString}',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(
              height: 16,
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
            )
          ],
        ),
      ),
    );
  }
}
