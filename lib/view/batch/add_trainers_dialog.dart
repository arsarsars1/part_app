import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/button.dart';
import 'package:part_app/view/components/checkbox.dart';
import 'package:part_app/view_model/cubits.dart';

class AddTrainersDialog extends StatefulWidget {
  final ValueChanged<List<int>> onSave;

  const AddTrainersDialog({Key? key, required this.onSave}) : super(key: key);

  @override
  State<AddTrainersDialog> createState() => _AddTrainersDialogState();
}

class _AddTrainersDialogState extends State<AddTrainersDialog> {
  List<int> selectedTrainers = [];
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
                    itemCount: cubit.trainers?.length ?? 0,
                    itemBuilder: (context, index) {
                      Trainer? trainer = cubit.trainers?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextCheckBox(
                          onChange: (value) {
                            setState(() {
                              if (value) {
                                selectedTrainers.add(trainer.id);
                              } else {
                                selectedTrainers.remove(trainer.id);
                              }
                            });
                          },
                          title: '${trainer?.user?.name}',
                          selected: selectedTrainers.contains(
                            trainer!.id,
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
                  widget.onSave(selectedTrainers);
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
