import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/fee/components/fee_list_item.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class AddOrEditFees extends StatefulWidget {
  static const route = '/fees/add-fees';
  const AddOrEditFees({super.key});

  @override
  State<AddOrEditFees> createState() => _AddOrEditFeesState();
}

class _AddOrEditFeesState extends State<AddOrEditFees> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  var formKey = GlobalKey<FormState>();
  String? amount;
  late FeeCubit feeCubit;
  @override
  void initState() {
    feeCubit = context.read<FeeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await feeCubit.getBatchInvoice(feeCubit.student.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Edit Fee Details',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) {
          if (state is AddedFees) {
            date = null;
            Alert(context).show(message: state.message);
            feeCubit.getBatchInvoice(feeCubit.student.id);
          } else if (state is AddFeesFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AddingFees || state is GettingBatchInvoice) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${feeCubit.batchFeeInvoice?.studentDetail?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              feeCubit.batchFeeInvoice?.feeType == "monthly"
                                  ? "Monthly"
                                  : "Class Based",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AppColors.green,
                                    fontSize: 11.sp,
                                  ),
                            ),
                            Text(
                              "Class Attended: ${feeCubit.batchFeeInvoice?.monthAttendancePresentCount} / ${feeCubit.batchFeeInvoice?.monthClassesConductedCount}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${feeCubit.batchFeeInvoice?.batchName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                            ),
                            Text(
                              "${feeCubit.batchFeeInvoice?.branchName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                            ),
                            Text(
                              "${feeCubit.batchFeeInvoice?.courseName}, ${feeCubit.batchFeeInvoice?.subjectName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                            ),
                          ],
                        ),
                        feeCubit.batchFeeInvoice?.feeType == "monthly"
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Payment Due Date: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                    TextSpan(
                                      text: feeCubit
                                          .batchFeeInvoice?.paymentDueDate
                                          ?.toDateString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Payment Due in: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                    TextSpan(
                                      text:
                                          '${10 - (feeCubit.batchFeeInvoice?.monthClassesConductedCount ?? 0)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Payment Status :",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 11.sp,
                                    ),
                          ),
                          Text(
                            feeCubit.batchFeeInvoice?.paymentStatus == "paid"
                                ? "Paid"
                                : feeCubit.batchFeeInvoice?.paymentStatus ==
                                        "pending"
                                    ? "Not Paid"
                                    : "Overdue",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 11.sp,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Fees: ₹${feeCubit.batchFeeInvoice?.payableAmount}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.all(16),
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: AppColors.liteDark,
              //     borderRadius: BorderRadius.circular(4),
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Container(
              //             width: 24.w,
              //             height: 24.w,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.black54,
              //               border: Border.all(
              //                 color: Colors.white,
              //                 width: 2,
              //               ),
              //             ),
              //             child: const Icon(
              //               Icons.close,
              //               size: 16,
              //               color: Colors.white,
              //             ),
              //           ),
              //           SizedBox(
              //             width: 15.w,
              //           ),
              //           Container(
              //             width: 24.w,
              //             height: 24.w,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.black54,
              //               border: Border.all(
              //                 color: Colors.white,
              //                 width: 2,
              //               ),
              //             ),
              //             child: const Icon(
              //               Icons.edit_outlined,
              //               size: 16,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 15.h,
              //       ),
              //       Table(
              //         border: TableBorder.all(
              //           color: AppColors.grey86,
              //           width: 0.5,
              //         ),
              //         children: [
              //           TableRow(
              //             children: [
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerLeft,
              //                     child: Text(
              //                       'Date',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: SizedBox(
              //                   height: 30.h,
              //                   child: Center(
              //                     child: Text(
              //                       'Updated By',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(right: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerRight,
              //                     child: Text(
              //                       'Amount',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           TableRow(
              //             children: [
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerLeft,
              //                     child: Text(
              //                       '07-08-2023',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.grey.shade700,
              //                             decoration: TextDecoration.lineThrough,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: SizedBox(
              //                   height: 30.h,
              //                   child: Center(
              //                     child: Text(
              //                       'Admin',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.grey.shade700,
              //                             decoration: TextDecoration.lineThrough,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(right: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerRight,
              //                     child: Text(
              //                       '₹100.00',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.grey.shade700,
              //                             decoration: TextDecoration.lineThrough,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           TableRow(
              //             children: [
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerLeft,
              //                     child: Text(
              //                       '09-08-2023',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.white,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: SizedBox(
              //                   height: 30.h,
              //                   child: Center(
              //                     child: Text(
              //                       'Admin',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.white,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(right: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerRight,
              //                     child: Text(
              //                       '₹200.00',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(
              //                             color: Colors.white,
              //                           ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Table(
              //         border: TableBorder.all(
              //           color: AppColors.grey86,
              //           width: 0.5,
              //         ),
              //         children: [
              //           TableRow(
              //             children: [
              //               TableCell(
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 10.h),
              //                   height: 30.h,
              //                   child: Align(
              //                     alignment: Alignment.centerLeft,
              //                     child: Text(
              //                       'Clerical Error',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge
              //                           ?.copyWith(),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              if ((feeCubit.batchFeeInvoice?.payments ?? []).isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: feeCubit.batchFeeInvoice?.payments?.length,
                  itemBuilder: (context, index) {
                    Payment? payment =
                        feeCubit.batchFeeInvoice?.payments?[index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 24.w,
                                height: 24.w,
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
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          DataTable(
                            headingRowHeight: 30.h,
                            dataRowMinHeight: 30.h,
                            dataRowMaxHeight: 30.h,
                            columnSpacing: 0.0,
                            horizontalMargin: 0.0,
                            columns: [
                              DataColumn(
                                label: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: CustomPaint(
                                      painter: DottedBorderPainter(),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            'Date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: CustomPaint(
                                    painter: DottedBorderPainter(),
                                    child: Center(
                                      child: Text(
                                        'Updated By',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: CustomPaint(
                                      painter: DottedBorderPainter(),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: Text(
                                            'Amount',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: CustomPaint(
                                          painter: DottedBorderPainter(),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                "${payment?.paymentDate?.toDateString()}",
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: CustomPaint(
                                        painter: DottedBorderPainter(),
                                        child: Center(
                                          child: Text(
                                            "${payment?.collectedBy?.name}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: CustomPaint(
                                          painter: DottedBorderPainter(),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5.0),
                                              child: Text(
                                                "${payment?.amount}",
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.liteDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Amount Payable: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(),
                          ),
                          TextSpan(
                            text: '₹${feeCubit.batchFeeInvoice?.pendingAmount}',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Add New Part Payment',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CommonField(
                      inputType: const TextInputType.numberWithOptions(),
                      length: 50,
                      title: 'Fees *',
                      hint: 'Enter Fees',
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter fees';
                        }
                        return null;
                      },
                      onChange: (value) {
                        amount = value;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            'Date *',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.liteDark,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              date == null
                                  ? Text(
                                      'Select the date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.grey700,
                                          ),
                                    )
                                  : Text(
                                      '${date?.toDateString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.grey400,
                                          ),
                                    ),
                              GestureDetector(
                                onTap: () async {
                                  await datePicker();
                                  dateController.text =
                                      date?.toDateString() ?? "";
                                },
                                child: const Icon(
                                  Icons.calendar_month,
                                  size: 24,
                                  color: Colors.white24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Button(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                feeCubit.addFees(feeCubit.batchFeeInvoice?.id, {
                                  'amount': amount,
                                  'payment_method': 'cash',
                                  'payment_date': date?.toServerString()
                                });
                              }
                            },
                            title: 'Submit',
                          ),
                        ),
                      ),
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

  // method to get the date for [ class ]
  Future<void> datePicker() async {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
    ).then((value) {
      if (value != null) {
        date = value;
        dateController.text = value.toDateString();
        setState(() {});
      }
    });
  }
}
