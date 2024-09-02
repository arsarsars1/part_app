import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/assignable_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignablePicker extends StatefulWidget {
  final int? trainerId;
  final List<int?> selectedTrainers;

  final ValueChanged<List<AssignableTrainer?>> onSave;
  final ValueChanged<AssignableTrainer?>? onSelect;

  final bool multiPicker;

  const AssignablePicker({
    super.key,
    this.trainerId,
    this.onSelect,
    required this.selectedTrainers,
    required this.onSave,
    this.multiPicker = true,
  });

  @override
  State<AssignablePicker> createState() => _AssignablePickerState();
}

class _AssignablePickerState extends State<AssignablePicker> {
  ScrollController scrollController = ScrollController();

  List<int?> trainers = [];
  int page = 0;

  @override
  void initState() {
    super.initState();

    context
        .read<BranchCubit>()
        .getAssignable(clean: true, trainerId: widget.trainerId);

    trainers.addAll(widget.selectedTrainers);
    // Pagination listener
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     if (widget.getAssignableTrainerLead && widget.trainerId != null) {
    //       context
    //           .read<BranchCubit>()
    //           .getAssignable(clean: true, trainerId: widget.trainerId!);
    //     }
    //   }
    // });
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
                        'Select Assignable',
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
                  cubit.trainersAssignable != null &&
                          cubit.trainersAssignable!.isNotEmpty
                      ? Expanded(
                          child: state is! TrainersLoaded
                              ? const LoadingView(color: Colors.transparent)
                              : ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemCount: cubit.trainersAssignable!.length,
                                  itemBuilder: (context, index) {
                                    AssignableTrainer trainer =
                                        cubit.trainersAssignable![index];
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
                                              title: trainer.name,
                                              selected: trainers.contains(
                                                trainer.id,
                                              ),
                                              horizontalPadding: 0,
                                            )
                                          : Text(
                                              trainer.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                            ),
                                      // leading: trainer.profilePic != null &&
                                      //         trainer.profilePic!.isNotEmpty
                                      //     ? UserImage(
                                      //         profilePic: trainer.profilePic,
                                      //       )
                                      //     : null,
                                    );
                                  },
                                ),
                        )
                      : const Expanded(
                          child: Center(
                          child: Text('Sorry, No trainers found.'),
                        )),
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
                          List<AssignableTrainer>? tempTrainers = cubit
                              .trainersAssignable
                              ?.where(
                                  (element) => trainers.contains(element.id))
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
