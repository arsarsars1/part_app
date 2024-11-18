import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/components/salary_list_item.dart';
import 'package:part_app/view/trainer/manager_app_add_advance_salary.dart';
import 'package:part_app/view/trainer/manager_app_add_or_edit_salary.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppTrainerSalarySlips extends StatefulWidget {
  static const route = '/manager-app-trainer-salary-slips';

  const ManagerAppTrainerSalarySlips({super.key});

  @override
  State<ManagerAppTrainerSalarySlips> createState() => _FeesDetailsViewState();
}

class _FeesDetailsViewState extends State<ManagerAppTrainerSalarySlips> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  String? query;

  int? year = DateTime.now().year;
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType;
  AuthCubit? authCubit;
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrainerCubit>().clean();
      context.read<TrainerCubit>().getSalaryDetailsForManager(
          trainerId: context.read<TrainerCubit>().trainer?.trainerDetail?[0].id,
          month: null,
          year: DateTime.now().year,
          clean: true,
          managerId: authCubit
                  ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
              0);
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
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
          trainerCubit.getSalaryDetailsForManager(
              trainerId: trainerCubit.trainer?.trainerDetail?[0].id,
              month: month,
              year: year,
              clean: true,
              managerId: authCubit
                      ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                  0);
        } else if (state is AddSalaryFailed) {
          Alert(context).show(message: state.message);
        } else if (state is ClosedSalary) {
          Alert(context).show(message: state.message);
          trainerCubit.getSalaryDetailsForManager(
              trainerId: trainerCubit.trainer?.trainerDetail?[0].id,
              month: month,
              year: year,
              clean: true,
              managerId: authCubit
                      ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                  0);
        } else if (state is CloseSalaryFailed) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${trainerCubit.trainer?.trainerDetail?[0].name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Button(
                      height: UIConstants.buttonHeight,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ManagerAppAddAdvanceSalaryPage.route,
                        );
                      },
                      title: 'Add Advance Salary',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
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
                      initialValue: '${DateTime.now().year}',
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
                                      context, ManagerAppAddOrEditSalary.route);
                                  trainerCubit.getSalaryDetailsForManager(
                                      trainerId: trainerCubit
                                          .trainer?.trainerDetail?[0].id,
                                      month: null,
                                      year: DateTime.now().year,
                                      clean: true,
                                      managerId: authCubit
                                              ?.user
                                              ?.managerDetail?[
                                                  authCubit?.managerIndex ?? 0]
                                              .id ??
                                          0);
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
    context.read<TrainerCubit>().getSalaryDetailsForManager(
        trainerId: context.read<TrainerCubit>().trainer?.trainerDetail?[0].id,
        month: month,
        year: year,
        clean: clean,
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0);
  }
}
