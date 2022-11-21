import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/constants/constant.dart';

class BatchItem extends StatelessWidget {
  final BatchModel batch;

  const BatchItem({Key? key, required this.batch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Batch Name',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Course Subject',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Trainer - ${batch.trainers}',
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
    );
  }
}
