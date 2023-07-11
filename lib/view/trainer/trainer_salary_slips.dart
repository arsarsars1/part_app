import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/trainer/components/salary_list_item.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerSalarySlips extends StatefulWidget {
  static const route = '/trainer-salary-slips';

  const TrainerSalarySlips({Key? key}) : super(key: key);

  @override
  State<TrainerSalarySlips> createState() => _FeesDetailsViewState();
}

class _FeesDetailsViewState extends State<TrainerSalarySlips> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;

  int? year;
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType;

  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().clean();
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    return BlocConsumer<TrainerCubit, TrainerState>(
      listener: (context, state) {
        if (state is AddedSalary) {
          Alert(context).show(message: state.message);
          trainerCubit.getSalaryDetails(
            branchId: branchId,
            month: month,
            year: year,
            clean: true,
          );
        } else if (state is AddSalaryFailed) {
          Alert(context).show(message: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: const CommonBar(
            title: 'Salary Payment History',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${trainerCubit.trainer?.trainerDetail?[0].name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BranchField(
                      onSelect: (value) {
                        setState(() {
                          branchId = value;
                          trainerCubit.branchId = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ScheduleField(
                      title: 'Year',
                      hint: 'Select a year',
                      dateMonth: true,
                      onDateSelect: (DateTime value) {
                        if (branchId == null) {
                          Alert(context).show(message: "Select a branch");
                        } else {
                          year = value.year;
                          doSearch(true);
                        }
                      },
                      time: false,
                      year: true,
                      selectedDate: finalDate,
                      controller: dateController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      title: 'Month',
                      hint: 'Select a month',
                      dropDown: true,
                      dropDownItems: DefaultValues().months,
                      defaultItem: DefaultValues().months.firstWhere(
                            (element) => element.title?.toLowerCase() == 'all',
                          ),
                      onChange: (value) {
                        month = value?.id;
                        doSearch(true);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state is FetchingTrainerSalary || state is AddingSalary
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              trainerCubit.salaryInvoice.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(64),
                                      child: Center(
                                        child: Text(
                                          state is TrainerSalaryFetched
                                              ? 'Sorry, No matching results found'
                                              : 'Select a branch and date to list the slips.',
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          trainerCubit.salaryInvoice.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        Data studentInvoice =
                                            trainerCubit.salaryInvoice[index];
                                        return SalaryListItem(
                                          salary: studentInvoice,
                                          onTap: () {},
                                        );
                                      },
                                    ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void doSearch(bool clean) {
    context.read<TrainerCubit>().getSalaryDetails(
          branchId: branchId,
          month: month,
          year: year,
          clean: clean,
        );
  }
}
