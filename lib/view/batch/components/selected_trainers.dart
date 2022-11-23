import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/batch/add_trainers_dialog.dart';
import 'package:part_app/view/constants/constant.dart';

class SelectedTrainers extends StatefulWidget {
  final ValueChanged<List<int>> selectedTrainers;

  const SelectedTrainers({Key? key, required this.selectedTrainers})
      : super(key: key);

  @override
  State<SelectedTrainers> createState() => _SelectedTrainersState();
}

class _SelectedTrainersState extends State<SelectedTrainers> {
  List<Trainer> selectedTrainers = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...selectedTrainers.map(
          (e) => Container(
            margin: const EdgeInsets.only(
              right: 16,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey400,
              border: Border.all(
                color: AppColors.grey700,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            width: 70,
            height: 70,
            child: const Icon(Icons.add),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: AppColors.liteDark,
                  content: AddTrainersDialog(
                    onSave: (List<Trainer> value) {
                      selectedTrainers = value;
                      widget.selectedTrainers(
                        value.map((e) => e.id).toList(),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  contentPadding: EdgeInsets.zero,
                );
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.only(
              right: 16,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey400,
              border: Border.all(
                color: AppColors.grey700,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            width: 70,
            height: 70,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
