import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/components/batch_item.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/students/assign_student_batch.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignBatch extends StatefulWidget {
  static const route = '/students/add/batches';

  const AssignBatch({Key? key}) : super(key: key);

  @override
  State<AssignBatch> createState() => _AssignBatchState();
}

class _AssignBatchState extends State<AssignBatch> {
  int? branchId;

  bool searched = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BatchCubit>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Assign Batches'),
      body: ListView(
        children: [
          Center(
            child: Text(cubit.studentRequest.name ?? 'Not Available'),
          ),
          const SizedBox(
            height: 20,
          ),
          BranchField(
            onSelect: (value) {
              setState(() {
                branchId = value;
                searched = true;
              });

              context.read<BatchCubit>().getBatchesByStatus(
                    branchId: value,
                    clean: true,
                    branchSearch: true,
                  );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CommonField(
            disabled: branchId == null,
            title: 'Search',
            hint: 'Search with Batch Name',
            onChange: (value) {
              if (value.isEmpty) {
                context.read<BatchCubit>().getBatchesByStatus(
                      branchId: branchId,
                      search: null,
                      clean: true,
                      branchSearch: true,
                    );
              }
            },
            prefixIcon: const Icon(Icons.search),
            onSubmit: (value) {
              if (value.isNotEmpty) {
                context.read<BatchCubit>().getBatchesByStatus(
                      branchId: branchId,
                      search: value,
                      clean: true,
                      branchSearch: true,
                    );
              }
            },
            textInputAction: TextInputAction.search,
          ),
          BlocConsumer<BatchCubit, BatchState>(
            listener: (context, state) {},
            buildWhen: (prv, crr) =>
                crr is BatchesFetched ||
                crr is FetchingBatches ||
                crr is BatchInitial,
            builder: (context, state) {
              var cubit = context.read<BatchCubit>();
              if (state is FetchingBatches) {
                return const Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: LoadingView(
                    hideColor: true,
                  ),
                );
              }
              if (cubit.batches.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Text(
                      searched
                          ? 'Sorry, No batches found.'
                          : 'Select a branch to get started',
                    ),
                  ),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.activeBatches.length,
                itemBuilder: (context, index) {
                  BatchModel batch = cubit.activeBatches[index];
                  return BatchItem(
                    reschedule: true,
                    addBatch: true,
                    batch: batch,
                    onAddToBatch: () {
                      context
                          .read<BatchCubit>()
                          .getBatch(batchId: '${batch.id}');
                      Navigator.pushNamed(context, AssignStudentBatch.route);
                    },
                    onTap: () {},
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
