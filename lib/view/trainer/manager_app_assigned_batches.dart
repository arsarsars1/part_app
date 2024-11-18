import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/batch/manager_app_batch_details.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppAssignedBatches extends StatefulWidget {
  static const route = 'trainer/manager-app-batches';

  const ManagerAppAssignedBatches({super.key});

  @override
  State<ManagerAppAssignedBatches> createState() => _AssignedBatchesState();
}

class _AssignedBatchesState extends State<ManagerAppAssignedBatches> {
  AuthCubit? authCubit;
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = context.read<TrainerCubit>();
      Trainer? trainer = cubit.trainer?.trainerDetail![0];
      context.read<BatchCubit>().getOngoigBatchesForTrainerForManager(
          trainer?.id,
          managerId: authCubit
                  ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
              0);
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
                        context.read<StudentCubit>().clean();
                        batchCubit.getBatchForManagerApp(
                            batchId: '${batch.id}',
                            managerId: authCubit
                                    ?.user
                                    ?.managerDetail?[
                                        authCubit?.managerIndex ?? 0]
                                    .id ??
                                0);
                        batchCubit.isFromBatch = false;
                        context.read<BranchCubit>().getBranchTrainersForManager(
                            branchId: '${batch.branchId}',
                            managerId: authCubit
                                    ?.user
                                    ?.managerDetail?[
                                        authCubit?.managerIndex ?? 0]
                                    .id ??
                                0);
                        await Navigator.pushNamed(
                            context, ManagerAppBatchDetails.route);
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
