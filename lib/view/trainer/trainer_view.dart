import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/add_trainer.dart';
import 'package:part_app/view/trainer/components/trainer_list.dart';
import 'package:part_app/view/trainer/trainer_details.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerPage extends StatefulWidget {
  static const route = '/trainer';

  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  int? branchId;
  String? query;
  String? temp;
  @override
  void initState() {
    super.initState();

    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BranchCubit>().getBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrainerCubit>();
    var branchCubit = context.read<BranchCubit>();
    return Scaffold(
      appBar: const CommonBar(
        title: 'Trainers List',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 16.h,
                    ),
                    child: Button(
                      height: 30.h,
                      onTap: () {
                        cubit.fromBranch = false;
                        cubit.selectedBranches = [];
                        Navigator.pushNamed(context, AddTrainer.route);
                      },
                      title: 'Add New Trainer',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<BranchCubit, BranchState>(
                  builder: (context, state) {
                    return CommonField(
                      title: 'Branch',
                      hint: 'Select Branch',
                      dropDown: true,
                      dropDownItems: branchCubit.dropDownBranches(),
                      onChange: (value) {
                        branchId = value.id;
                        setState(() {
                          // cubit.searchTrainers(branchId, query: null);
                          cubit.getActiveInactiveTrainers(
                              branchId: branchId, active: true);
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonField(
                  prefixIcon: const Icon(Icons.search),
                  title: 'Search',
                  maxLines: 1,
                  hint: 'Search By Trainer Name Or Phone Number',
                  dropDown: false,
                  textInputAction: TextInputAction.search,
                  onSubmit: (value) {
                    if (value.toString().isNotEmpty) {
                      query = value;
                      cubit.searchTrainers(branchId, query: value);
                    } else {
                      cubit.getTrainers();
                      query = null;
                    }
                  },
                  onChange: (value) {
                    if (value.toString().isEmpty) {
                      query = null;
                      cubit.getTrainers();
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                branchId != null
                    ? Column(
                        children: [
                          TabButton(
                            onChange: (String value) {
                              temp = value;
                              if (value == "Active Trainers") {
                                cubit.getActiveInactiveTrainers(
                                    branchId: branchId, active: true);
                              } else {
                                cubit.getActiveInactiveTrainers(
                                    branchId: branchId, clean: true);
                              }
                            },
                            options: const [
                              'Active Trainers',
                              'Inactive Trainers',
                            ],
                          ),
                          BlocBuilder<TrainerCubit, TrainerState>(
                            builder: (context, state) {
                              if (state is FetchingTrainers) {
                                return const Padding(
                                  padding: EdgeInsets.all(64.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              // ignore: prefer_is_empty
                              if (cubit.trainers?.length == 0) {
                                return Padding(
                                  padding: const EdgeInsets.all(64.0),
                                  child: Center(
                                    child: Text(
                                      query == null
                                          ? 'Empty List'
                                          : 'Sorry, No Matching Results Found.',
                                    ),
                                  ),
                                );
                              }
                              return TrainerList(
                                trainers: cubit.trainers ?? [],
                                onSelect: (Trainer trainer) async {
                                  context
                                      .read<TrainerCubit>()
                                      .getTrainerDetails(
                                        trainerId: trainer.id,
                                      );
                                  await Navigator.pushNamed(
                                      context, TrainerDetails.route);
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<TrainerCubit>()
                                      .getActiveInactiveTrainers(
                                          branchId: branchId,
                                          active: temp == "Active Trainers"
                                              ? true
                                              : false);
                                },
                              );
                            },
                          ),
                        ],
                      )
                    : const Padding(
                        padding: EdgeInsets.all(64.0),
                        child: Center(
                          child: Text(
                            'Select a branch',
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
