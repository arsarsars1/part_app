import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/fee/add_or_edit_admission_fees.dart';
import 'package:part_app/view/fee/components/admission_fee_list_item.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class StudentAdmissionFeeDetails extends StatefulWidget {
  static const route = '/student-admission-fee-details';

  const StudentAdmissionFeeDetails({Key? key}) : super(key: key);

  @override
  State<StudentAdmissionFeeDetails> createState() =>
      _StudentAdmissionFeeDetailsState();
}

class _StudentAdmissionFeeDetailsState
    extends State<StudentAdmissionFeeDetails> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int? branchId;
  String? query;
  BatchModel? batch;

  int? year;
  String? status = 'all';
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType = 'all';

  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
      context.read<FeeCubit>().getAdmissionFeeDetails(
          feeType: "all",
          searchQuery: query,
          paymentStatus: "all",
          studentId: context.read<StudentCubit>().student?.studentDetail?[0].id,
          clean: true);
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
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Student Admission Fees Details',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) {
          var cubit = context.read<FeeCubit>();
          if (state is FeeReminderSent) {
            Alert(context).show(message: state.message);
            cubit.getAdmissionFeeDetails(
                feeType: feeType,
                searchQuery: query,
                paymentStatus: status,
                studentId:
                    context.read<StudentCubit>().student?.studentDetail?[0].id,
                clean: true);
          } else if (state is FeeReminderSentFailed) {
            Alert(context).show(message: state.message);
          } else if (state is WrittenOff) {
            Alert(context).show(message: state.message);
            cubit.getAdmissionFeeDetails(
                feeType: feeType,
                searchQuery: query,
                paymentStatus: status,
                studentId:
                    context.read<StudentCubit>().student?.studentDetail?[0].id,
                clean: true);
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: TabButton(
                    //     onChange: (String value) {
                    //       if (value == 'Monthly') {
                    //         setState(() {
                    //           feeType = 'monthly';
                    //           cubit.batchInvoice.clear();
                    //           status = 'all';
                    //         });
                    //         cubit.getAdmissionFeeDetails(
                    //             feeType: feeType,
                    //             searchQuery: query,
                    //             paymentStatus: status,
                    //             studentId: context
                    //                 .read<StudentCubit>()
                    //                 .student
                    //                 ?.studentDetail?[0]
                    //                 .id,
                    //             clean: true);
                    //       } else {
                    //         setState(() {
                    //           feeType = 'class';
                    //           cubit.batchInvoice.clear();
                    //           status = 'all';
                    //         });
                    //         cubit.getAdmissionFeeDetails(
                    //             feeType: feeType,
                    //             searchQuery: query,
                    //             paymentStatus: status,
                    //             studentId: context
                    //                 .read<StudentCubit>()
                    //                 .student
                    //                 ?.studentDetail?[0]
                    //                 .id,
                    //             clean: true);
                    //       }
                    //     },
                    //     options: const [
                    //       'Monthly',
                    //       'Class Based',
                    //     ],
                    //   ),
                    // ),
                    CommonField(
                      title: 'Fee Type',
                      hint: 'Select a fee type',
                      dropDown: true,
                      dropDownItems: DefaultValues().feeType,
                      defaultItem: DefaultValues().feeType.firstWhere(
                            (element) => element.title?.toLowerCase() == 'all',
                          ),
                      onChange: (value) {
                        feeType = value?.id;
                        doSearch(true);
                      },
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
                              return AdmissionFeeListItem(
                                isFromAdmission: true,
                                student: studentInvoice,
                                onTap: () async {
                                  cubit.student = studentInvoice;
                                  await Navigator.pushNamed(
                                      context, AddOrEditAdmissionFees.route);
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
    context.read<FeeCubit>().getAdmissionFeeDetails(
          feeType: feeType,
          searchQuery: query,
          paymentStatus: status,
          studentId: context.read<StudentCubit>().student?.studentDetail?[0].id,
          clean: clean,
        );
  }
}
