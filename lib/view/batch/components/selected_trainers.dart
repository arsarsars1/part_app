import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/cached_image.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/trainer_picker.dart';

class SelectedTrainers extends StatefulWidget {
  final ValueChanged<List<Trainer?>> selectedTrainers;
  final List<Trainer>? trainers;
  final int? branchId;
  final bool batchDetails;
  final bool showAddButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const SelectedTrainers(
      {super.key,
      required this.selectedTrainers,
      this.trainers,
      this.showAddButton = true,
      this.batchDetails = false,
      this.scaffoldKey,
      this.branchId});

  @override
  State<SelectedTrainers> createState() => _SelectedTrainersState();
}

class _SelectedTrainersState extends State<SelectedTrainers> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6.5;
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        if (widget.trainers != null && widget.trainers!.isEmpty)
          Text(
            'No trainer allocated.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.primaryColor,
            ),
          )
        else
          ...?widget.trainers?.map(
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
                        detail.profilePic != ""
                            ? '${F.baseUrl}'
                                '/admin/images/trainer/'
                                '${detail.id}/${detail.profilePic}'
                            : '',
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
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            },
          ),
        if (widget.showAddButton)
          GestureDetector(
            onTap: () {
              List<int?> trainers = [];
              if (widget.batchDetails) {
                trainers = widget.trainers?.map((e) => e.userId).toList() ?? [];
              } else {
                trainers = widget.trainers
                        ?.map((e) => e.trainerDetail?[0].userId)
                        .toList() ??
                    [];
              }

              if (widget.branchId == null) return;
              widget.scaffoldKey?.currentState?.showBottomSheet(
                elevation: 10,
                backgroundColor: Colors.transparent,
                (context) => TrainerPicker(
                  branchId: widget.branchId!,
                  selectedTrainers: trainers,
                  onSave: (List<Trainer?> value) {
                    widget.selectedTrainers(value);

                    // setState(() {
                    //   widget.trainers = value;
                    // });
                  },
                ),
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
