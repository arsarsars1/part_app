import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/models.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerPicker extends StatefulWidget {
  final int? branchId;
  final int? batchId;
  final List<int?> selectedTrainers;

  final ValueChanged<List<Trainer?>> onSave;
  final ValueChanged<TrainerModel?>? onSelect;

  final bool isBatch;
  final bool multiPicker;

  const TrainerPicker({
    super.key,
    this.branchId,
    this.onSelect,
    this.batchId,
    this.isBatch = false,
    required this.selectedTrainers,
    required this.onSave,
    this.multiPicker = true,
  });

  @override
  State<TrainerPicker> createState() => _TrainerPickerState();
}

class _TrainerPickerState extends State<TrainerPicker> {
  ScrollController scrollController = ScrollController();

  List<int?> trainers = [];
  int page = 0;

  @override
  void initState() {
    super.initState();

    if (widget.isBatch) {
      context.read<BranchCubit>().getTrainers(clean: true);
    }
    trainers.addAll(widget.selectedTrainers);
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (widget.isBatch) {
          context.read<BranchCubit>().getBatchTrainers(
                batchId: '${widget.batchId}',
              );
        } else {
          context.read<BranchCubit>().getBranchTrainers(
                branchId: '${widget.branchId}',
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BranchCubit>();
    return BlocBuilder<BranchCubit, BranchState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black54,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.liteDark,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Trainer',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  cubit.trainersList.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text('Sorry, No trainers found.'),
                        ))
                      : Expanded(
                          child: cubit.trainersList.isEmpty &&
                                  state is! FetchingBatches
                              ? const LoadingView()
                              : ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemCount: cubit.trainersList.length,
                                  itemBuilder: (context, index) {
                                    TrainerModel trainer =
                                        cubit.trainersList[index];
                                    return ListTile(
                                      onTap: () {
                                        if (widget.onSelect != null) {
                                          widget.onSelect!(trainer);
                                          Navigator.pop(context);
                                        }
                                      },
                                      title: widget.multiPicker
                                          ? TextSwitchButton(
                                              onChange: (bool value) {
                                                if (value) {
                                                  trainers.add(trainer.id);
                                                } else {
                                                  trainers.remove(trainer.id);
                                                }
                                                setState(() {});
                                              },
                                              title:
                                                  trainer.trainerName ?? 'NA',
                                              selected: trainers.contains(
                                                trainer.id,
                                              ),
                                              horizontalPadding: 0,
                                            )
                                          : Text(
                                              trainer.trainerName ?? 'NA',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                            ),
                                      leading: UserImage(
                                        profilePic: trainer.profilePic,
                                      ),
                                    );
                                  },
                                ),
                        ),
                  BlocBuilder<BranchCubit, BranchState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        height: state is BranchesLoading && state.pagination
                            ? 30
                            : 0,
                        color: Colors.black,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child: const Center(
                          child: Text('Fetching more items ..'),
                        ),
                      );
                    },
                  ),
                  if (widget.multiPicker)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Button(
                        onTap: () {
                          var cubit = context.read<BranchCubit>();
                          List<Trainer>? tempTrainers = cubit.trainers
                              ?.where((element) => trainers
                                  .contains(element.trainerDetail?[0].userId))
                              .toList();
                          widget.onSave(tempTrainers ?? []);
                          Navigator.pop(context);
                        },
                        title: 'Save',
                      ),
                    )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
