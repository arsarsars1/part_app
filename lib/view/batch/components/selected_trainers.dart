import 'package:flutter/material.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/batch/add_trainers_dialog.dart';
import 'package:part_app/view/components/cached_image.dart';
import 'package:part_app/view/constants/constant.dart';

class SelectedTrainers extends StatefulWidget {
  final ValueChanged<List<int?>> selectedTrainers;
  final List<Trainer>? trainers;

  const SelectedTrainers(
      {Key? key, required this.selectedTrainers, this.trainers})
      : super(key: key);

  @override
  State<SelectedTrainers> createState() => _SelectedTrainersState();
}

class _SelectedTrainersState extends State<SelectedTrainers> {
  List<Trainer> selectedTrainers = [];

  @override
  void initState() {
    super.initState();
    if (widget.trainers != null) {
      selectedTrainers.addAll(widget.trainers!);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6.5;
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        ...selectedTrainers.map(
          (e) {
            var detail = e.trainerDetail?[0] ?? e;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    bottom: 8,
                    left: 16,
                    top: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey700,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  width: width,
                  height: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CachedImage(
                      '${F.baseUrl}/admin/images/trainer/${detail.id}/${detail.profilePic}',
                    ).image(),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    '${detail.name}',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
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
                    selectedItems: widget.trainers ?? [],
                    onSave: (List<Trainer> value) {
                      widget.selectedTrainers(
                        value.map((e) => e.trainerDetail?[0].id).toList(),
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
              left: 16,
              top: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey400,
              border: Border.all(
                color: AppColors.grey700,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            width: width,
            height: width,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
