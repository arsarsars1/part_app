import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/batch/add_batch.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';
import 'package:part_app/view_model/cubits.dart';

class BatchesPage extends StatefulWidget {
  static const route = '/batches';

  const BatchesPage({Key? key}) : super(key: key);

  @override
  State<BatchesPage> createState() => _BatchesPageState();
}

class _BatchesPageState extends State<BatchesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BatchCubit>().getBatches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();

    return Scaffold(
      appBar: const CommonBar(title: 'Batches'),
      body: ListView(
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
          BlocBuilder<BatchCubit, BatchState>(
            buildWhen: (prv, crr) => crr is BatchesFetched,
            builder: (context, state) {
              if (cubit.batches.isEmpty) {
                return const Center(
                  child: Text('Add Batch to Get Started'),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.batches.length,
                itemBuilder: (context, index) {
                  return BatchItem(
                    batch: cubit.batches[index],
                    onTap: () {
                      context
                          .read<BatchCubit>()
                          .getBatch(batchId: '${cubit.batches[index].id}');
                      Navigator.pushNamed(context, BatchDetails.route);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
