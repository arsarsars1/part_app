import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/batch/add_trainers_dialog.dart';
import 'package:part_app/view/components/cached_image.dart';
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
          (e) {
            var element = e.trainerDetail?[0];
            return Container(
              margin: const EdgeInsets.only(
                right: 16,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey700,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              width: 68,
              height: 68,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: CachedImage(
                  '${F.baseUrl}/admin/images/trainer/${element?.id}/${element?.profilePic}',
                ).image(),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: AppColors.liteDark,
                  content: AddTrainersDialog(
                    selectedItems: selectedTrainers,
                    onSave: (List<Trainer> value) {
                      widget.selectedTrainers(
                        value.map((e) => e.trainerDetail![0].id).toList(),
                      );
                      setState(() {
                        selectedTrainers = value;
                      });
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
            width: 68,
            height: 68,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
