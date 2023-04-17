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

  @override
  void initState() {
    super.initState();

    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().getActiveInactiveTrainers(active: true);
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
        // physics: const NeverScrollableScrollPhysics(),
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
                  cubit.trainers?.clear();
                  cubit.searchTrainers(branchId, query: null);
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
          TabButton(
            onChange: (String value) {
              if (value == "Active Trainers") {
                context
                    .read<TrainerCubit>()
                    .getActiveInactiveTrainers(active: true);
              } else {
                context
                    .read<TrainerCubit>()
                    .getActiveInactiveTrainers(clean: true);
              }

              // cubit.filterTrainers(active: value == 'Active Trainers');
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

              if (cubit.trainers!.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: Center(
                    child: Text(
                      query == null
                          ? 'Add Trainer to Get Started'
                          : 'Sorry, No Matching Results Found.',
                    ),
                  ),
                );
              }
              return Expanded(
                child: TrainerList(
                  trainers: cubit.trainers ?? [],
                  onSelect: (Trainer trainer) {
                    context.read<TrainerCubit>().getTrainerDetails(
                          trainerId: trainer.id,
                        );
                    Navigator.pushNamed(context, TrainerDetails.route);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
