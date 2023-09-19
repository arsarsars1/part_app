import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/fee/add_advance_fee.dart';
import 'package:part_app/view/fee/add_or_edit_fees.dart';
import 'package:part_app/view/fee/components/fee_list_item.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class StudentFeeDetails extends StatefulWidget {
  static const route = '/student-fee-details';

  const StudentFeeDetails({Key? key}) : super(key: key);

  @override
  State<StudentFeeDetails> createState() => _StudentFeeDetailsState();
}

class _StudentFeeDetailsState extends State<StudentFeeDetails> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? query;

  int? year;
  String? status = 'all';
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType = 'monthly';

  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
    });
    // Pagination listener
    scrollController.position.isScrollingNotifier.addListener(() async {
      // var nextPageTrigger = 0.60 * scrollController.position.maxScrollExtent;
      if (!scrollController.position.isScrollingNotifier.value) {
        doSearch(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Student Fees Details',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) {
          var cubit = context.read<FeeCubit>();
          if (state is FeeReminderSent) {
            Alert(context).show(message: state.message);
            cubit.getStudentFeeDetails(
              month: month,
              year: year,
              feeType: feeType,
              searchQuery: query,
              paymentStatus: status,
              studentId:
                  context.read<StudentCubit>().student?.studentDetail?[0].id,
              clean: true,
            );
          } else if (state is FeeReminderSentFailed) {
            Alert(context).show(message: state.message);
          } else if (state is WrittenOff) {
            Alert(context).show(message: state.message);
            cubit.getStudentFeeDetails(
              month: month,
              year: year,
              feeType: feeType,
              searchQuery: query,
              paymentStatus: status,
              studentId:
                  context.read<StudentCubit>().student?.studentDetail?[0].id,
              clean: true,
            );
          } else if (state is WriteOffFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = context.read<FeeCubit>();
          return Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Button(
                      height: 30.h,
                      onTap: () {
                        context.read<StudentCubit>().getStudentBatches();
                        Navigator.pushNamed(
                          context,
                          AddAdvanceFeePage.route,
                        );
                      },
                      title: 'Add Advance Fee',
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TabButton(
                        onChange: (String value) {
                          if (value == 'Monthly') {
                            setState(() {
                              feeType = 'monthly';
                              cubit.batchInvoice.clear();
                              status = 'all';
                            });
                            cubit.getStudentFeeDetails(
                              month: month,
                              year: year,
                              feeType: feeType,
                              searchQuery: query,
                              paymentStatus: status,
                              studentId: context
                                  .read<StudentCubit>()
                                  .student
                                  ?.studentDetail?[0]
                                  .id,
                              clean: true,
                            );
                          } else {
                            setState(() {
                              feeType = 'class';
                              cubit.batchInvoice.clear();
                              status = 'all';
                            });
                            cubit.getStudentFeeDetails(
                              month: month,
                              year: year,
                              feeType: feeType,
                              searchQuery: query,
                              paymentStatus: status,
                              studentId: context
                                  .read<StudentCubit>()
                                  .student
                                  ?.studentDetail?[0]
                                  .id,
                              clean: true,
                            );
                          }
                        },
                        options: const [
                          'Monthly',
                          'Class Based',
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (feeType == 'monthly')
                      Column(
                        children: [
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
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonField(
                            title: 'Month',
                            hint: 'Select a month',
                            dropDown: true,
                            dropDownItems: DefaultValues().months,
                            defaultItem: DefaultValues().months.firstWhere(
                                  (element) =>
                                      element.title?.toLowerCase() == 'all',
                                ),
                            onChange: (value) {
                              month = value?.id;
                              doSearch(true);
                            },
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonField(
                      title: 'Payment Status',
                      hint: 'Select a status',
                      dropDown: true,
                      dropDownItems: DefaultValues().paymentStatuses,
                      defaultItem: DefaultValues().paymentStatuses.firstWhere(
                            (element) => element.title?.toLowerCase() == 'all',
                          ),
                      onChange: (value) {
                        status = value?.id;
                        doSearch(true);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is FetchingFee && !state.pagination)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (state is FeeReminderSending || state is WritingOff)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    cubit.batchInvoice.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(64),
                            child: Center(
                              child: Text(
                                state is FeeFetched
                                    ? 'Sorry, No matching results found'
                                    : 'Select the details from above',
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.batchInvoice.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Datum studentInvoice = cubit.batchInvoice[index];
                              return FeeListItem(
                                student: studentInvoice,
                                onTap: () async {
                                  cubit.student = studentInvoice;
                                  await Navigator.pushNamed(
                                      context, AddOrEditFees.route);
                                  doSearch(true);
                                },
                              );
                            },
                          ),
                    if (state is FetchingFee && state.pagination)
                      const Center(
                        child: Text('Fetching more items ..'),
                      )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<FeeCubit>().getStudentFeeDetails(
          month: month,
          year: year,
          feeType: feeType,
          searchQuery: query,
          paymentStatus: status,
          studentId: context.read<StudentCubit>().student?.studentDetail?[0].id,
          clean: clean,
        );
  }
}
