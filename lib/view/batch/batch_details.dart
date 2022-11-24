import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchDetails extends StatefulWidget {
  static const route = '/batch/details';
  const BatchDetails({Key? key}) : super(key: key);

  @override
  State<BatchDetails> createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Batch Details',
      ),
      body: BlocBuilder<BatchCubit, BatchState>(
        builder: (context, state) {
          BatchModel? batch = context.read<BatchCubit>().batch;
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${batch?.name}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${batch?.branchName}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${batch?.courseName}, ${batch?.subjectName}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Text(
                          '${batch?.days[index]}',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        );
                      },
                      itemCount: batch?.days.length ?? 0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Admission Fees: ${batch?.subjectName}',
                        style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Fees: ${batch?.subjectName}',
                        style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
