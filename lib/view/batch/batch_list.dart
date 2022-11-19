import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchesPage extends StatefulWidget {
  static const route = '/batches';

  const BatchesPage({Key? key}) : super(key: key);

  @override
  State<BatchesPage> createState() => _BatchesPageState();
}

class _BatchesPageState extends State<BatchesPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();

    return Scaffold(
      appBar: const CommonBar(title: 'Batches'),
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
                height: 30.h,
                onTap: () {
                  Navigator.pushNamed(context, AddBatch.route);
                },
                title: 'Add New Batch',
              ),
            ),
          ),
          BranchField(
            onSelect: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            title: 'Search',
            hint: 'Search Branch',
            onChange: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabButton(
              onChange: (String value) {},
              options: const [
                'Ongoing Batches',
                'Completed Batches',
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.liteDark,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Batch 1',
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
                Text(
                  'Active Students: 10',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                Text(
                  'Course Subject',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Trainer - Leo, Yami',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Mon',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Tue',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Mon',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
