import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/button.dart';
import 'package:part_app/view/components/checkbox.dart';
import 'package:part_app/view_model/cubits.dart';

class AddTrainersDialog extends StatefulWidget {
  final ValueChanged<List<Trainer>> onSave;
  final List<Trainer> selectedItems;

  const AddTrainersDialog(
      {Key? key, required this.onSave, required this.selectedItems})
      : super(key: key);

  @override
  State<AddTrainersDialog> createState() => _AddTrainersDialogState();
}

class _AddTrainersDialogState extends State<AddTrainersDialog> {
  List<int> selectedTrainers = [];

  @override
  void initState() {
    super.initState();
    var items = widget.selectedItems.map((e) => e.id).toList();
    selectedTrainers.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Select Batch Trainers',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<BranchCubit, BranchState>(
                builder: (context, state) {
                  var cubit = context.read<BranchCubit>();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.activeTrainers?.length ?? 0,
                    itemBuilder: (context, index) {
                      Trainer? trainer = cubit.activeTrainers?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextCheckBox(
                          onChange: (value) {
                            setState(() {
                              if (value) {
                                selectedTrainers
                                    .add(trainer.trainerDetail![0].id);
                              } else {
                                selectedTrainers
                                    .remove(trainer.trainerDetail![0].id);
                              }
                            });
                          },
                          title: '${trainer?.trainerDetail?[0].name}',
                          selected: selectedTrainers.contains(
                            trainer!.trainerDetail![0].id,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Button(
                onTap: () {
                  var cubit = context.read<BranchCubit>();
                  var trainers = cubit.trainers
                      ?.where((element) => selectedTrainers
                          .contains(element.trainerDetail?[0].id))
                      .toList();
                  widget.onSave(trainers ?? []);
                },
                title: 'Save',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
