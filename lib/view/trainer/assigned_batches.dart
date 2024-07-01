import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/batch/batch_details.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignedBatches extends StatefulWidget {
  static const route = 'trainer/batches';

  const AssignedBatches({super.key});

  @override
  State<AssignedBatches> createState() => _AssignedBatchesState();
}

class _AssignedBatchesState extends State<AssignedBatches> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = context.read<TrainerCubit>();
      Trainer? trainer = cubit.trainer?.trainerDetail![0];
      context.read<BatchCubit>().getOngoigBatchesForTrainer(trainer?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrainerCubit>();
    var batchCubit = context.read<BatchCubit>();
    Trainer? trainer = cubit.trainer?.trainerDetail![0];
    return Scaffold(
      appBar: const CommonBar(title: 'Assigned Batches'),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            Text(
              trainer?.name ?? 'NA',
              textAlign: TextAlign.center,
            ),
            BlocBuilder<BatchCubit, BatchState>(
              buildWhen: (prv, crr) => crr is BatchesFetched,
              builder: (context, state) {
                if (batchCubit.batches.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(64.0),
                      child: Text('No batches assigned.'),
                    ),
                  );
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: batchCubit.batches.length,
                  itemBuilder: (context, index) {
                    BatchModel batch = batchCubit.batches[index];
                    return BatchItem(
                      hideTrainer: true,
                      batch: batch,
                      onTap: () async {
                        batchCubit.getBatch(batchId: '${batch.id}');
                        batchCubit.isFromBatch = false;
                        context
                            .read<BranchCubit>()
                            .getBranchTrainers(branchId: '${batch.branchId}');
                        await Navigator.pushNamed(context, BatchDetails.route);
                        batchCubit.isFromBatch = true;
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
