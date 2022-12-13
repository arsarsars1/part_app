import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/tab_button.dart';
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

  @override
  void initState() {
    super.initState();

    // get the trainers list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().getTrainers();
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
      body: ListView(
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
                cubit.searchTrainers(branchId, query: value);
              } else {
                cubit.getTrainers();
              }
            },
            onChange: (value) {
              if (value.toString().isNotEmpty) {
                cubit.searchTrainers(branchId, query: value);
              } else {
                cubit.getTrainers();
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          TabButton(
            onChange: (String value) {
              cubit.filterTrainers(active: value == 'Active Trainers');
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
              if ((cubit.trainers == null || cubit.trainers!.isEmpty) &&
                  state is! SearchedTrainers) {
                return const Padding(
                  padding: EdgeInsets.all(64.0),
                  child: Center(
                    child: Text('Add Trainer to Get Started'),
                  ),
                );
              }

              if (cubit.filteredTrainers.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(64.0),
                  child: Center(
                    child: Text('Sorry, No Matching Results Found.'),
                  ),
                );
              }
              return TrainerList(
                trainers: cubit.filteredTrainers,
                onSelect: (Trainer trainer) {
                  context.read<TrainerCubit>().getTrainerDetails(
                        trainerId: trainer.id,
                      );
                  Navigator.pushNamed(context, TrainerDetails.route);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
