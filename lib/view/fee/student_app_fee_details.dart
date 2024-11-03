// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/student_app_fee_detail_history.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/fee/components/student_app_fee_list_item.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class StudentAppFeeDetails extends StatefulWidget {
  static const route = '/student-app-fee-details';

  const StudentAppFeeDetails({super.key});

  @override
  State<StudentAppFeeDetails> createState() => _StudentAppFeeDetailsState();
}

class _StudentAppFeeDetailsState extends State<StudentAppFeeDetails> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? query;

  int? year = DateTime.now().year;
  String? status = 'all';
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType = 'monthly';
  var cubit;
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
      doSearch(false);
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
    var authCubit = context.read<AuthCubit>();
    var feeCubit = context.read<FeeCubit>();
    return WillPopScope(
      onWillPop: () async {
        feeCubit.invoices.clear();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: CommonBar(
          title: 'Student Fees Details',
          onPressed: () {
            feeCubit.invoices.clear();
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<FeeCubit, FeeState>(
          listener: (context, state) {
            var cubit = context.read<FeeCubit>();
            if (state is FeeReminderSent) {
              Alert(context).show(message: state.message);
              cubit.getStudentAppFeeDetails(
                month: month,
                year: year,
                feeType: feeType,
                searchQuery: query,
                paymentStatus: status,
                studentId:
                    authCubit.user?.studentDetail?[authCubit.studentIndex].id,
                clean: true,
              );
            } else if (state is FeeReminderSentFailed) {
              Alert(context).show(message: state.message);
            } else if (state is WrittenOff) {
              Alert(context).show(message: state.message);
              cubit.getStudentAppFeeDetails(
                month: month,
                year: year,
                feeType: feeType,
                searchQuery: query,
                paymentStatus: status,
                studentId:
                    authCubit.user?.studentDetail?[authCubit.studentIndex].id,
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
                              cubit.getStudentAppFeeDetails(
                                month: month,
                                year: year,
                                feeType: feeType,
                                searchQuery: query,
                                paymentStatus: status,
                                studentId: authCubit.user
                                    ?.studentDetail?[authCubit.studentIndex].id,
                                clean: true,
                              );
                            } else {
                              setState(() {
                                feeType = 'class';
                                cubit.batchInvoice.clear();
                                status = 'all';
                              });
                              cubit.getStudentAppFeeDetails(
                                month: month,
                                year: year,
                                feeType: feeType,
                                searchQuery: query,
                                paymentStatus: status,
                                studentId: authCubit.user
                                    ?.studentDetail?[authCubit.studentIndex].id,
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
                              initialValue: DateTime.now().year.toString(),
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
                              (element) =>
                                  element.title?.toLowerCase() == 'all',
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
                      cubit.invoices.isEmpty
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
                              itemCount: cubit.invoices.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                Invoice invoice = cubit.invoices[index];
                                return StudentAppFeeListItem(
                                  invoice: invoice,
                                  onTap: () async {},
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
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<FeeCubit>().getStudentAppFeeDetails(
          month: month,
          year: year,
          feeType: feeType,
          searchQuery: query,
          paymentStatus: status,
          studentId: cubit.user?.studentDetail?[cubit.studentIndex].id,
          clean: clean,
        );
  }
}
