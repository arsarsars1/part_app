import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignedBatches extends StatefulWidget {
  static const route = 'trainer/batches';

  const AssignedBatches({Key? key}) : super(key: key);

  @override
  State<AssignedBatches> createState() => _AssignedBatchesState();
}

class _AssignedBatchesState extends State<AssignedBatches> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrainerCubit>();
    Trainer? trainer = cubit.trainer?.trainerDetail![0];
    return Scaffold(
      appBar: const CommonBar(title: 'Assigned Batches'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              trainer?.name ?? 'NA',
              textAlign: TextAlign.center,
            ),
            // ListView.builder(
            //   itemBuilder: (context, index) {},
            // ),
          ],
        ),
      ),
    );
  }
}
