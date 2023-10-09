import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/trainer/add_or_edit_salary.dart';
import 'package:part_app/view/trainer/components/salary_list_item.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerSalarySlipsHome extends StatefulWidget {
  static const route = '/trainer-salary-slips-home';

  const TrainerSalarySlipsHome({Key? key}) : super(key: key);

  @override
  State<TrainerSalarySlipsHome> createState() => _FeesDetailsViewState();
}

class _FeesDetailsViewState extends State<TrainerSalarySlipsHome> {
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
      var branchCubit = context.read<BranchCubit>();
      branchId = branchCubit.firstBranch.id;
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
        if (state is ClosedSalary) {
          Alert(context).show(message: state.message);
          trainerCubit.getSalaryDetails(
            branchId: branchId,
            month: month,
            year: year,
            clean: true,
          );
        } else if (state is CloseSalaryFailed) {
          Alert(context).show(message: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: const CommonBar(
            title: 'Salary Details',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: BranchField(
                        onSelect: (value) {
                          setState(() {
                            branchId = value;
                            trainerCubit.salaryInvoice.clear();
                            dateController.clear();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ScheduleField(
                      title: 'Year',
                      hint: 'Select a year',
                      dateMonth: true,
                      onDateSelect: (DateTime value) {
                        year = value.year;
                        doSearch(true);
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
                      height: 20,
                    ),
                    CommonField(
                      title: 'Search',
                      hint: 'Search By Name or Phone Number',
                      onChange: (value) {
                        if (value.isEmpty) {
                          query = null;
                        } else {
                          query = value;
                        }
                        doSearch(true);
                      },
                      onSubmit: (value) {
                        if (value.isEmpty) {
                          query = null;
                        } else {
                          query = value;
                        }
                        doSearch(true);
                      },
                      textInputAction: TextInputAction.search,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is FetchingTrainerSalary && !state.pagination)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (state is AddingSalary || state is ClosingSalary)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    trainerCubit.salaryInvoice.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(64),
                            child: Center(
                              child: Text(
                                state is TrainerSalaryFetched
                                    ? 'Sorry, No matching results found'
                                    : 'Select a date to list the slips.',
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: trainerCubit.salaryInvoice.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Data studentInvoice =
                                  trainerCubit.salaryInvoice[index];
                              return SalaryListItem(
                                salary: studentInvoice,
                                onTap: () async {
                                  trainerCubit.slipDetails = studentInvoice;
                                  await Navigator.pushNamed(
                                      context, AddOrEditSalary.route);
                                  doSearch(true);
                                },
                              );
                            },
                          ),
                    if (state is FetchingTrainerSalary && state.pagination)
                      const Center(
                        child: Text('Fetching more items ..'),
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
          searchQuery: query,
          month: month,
          year: year,
          clean: clean,
        );
  }
}
