import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/trainer/components/edit_salary.dart';
import 'package:part_app/view/trainer/components/salary_list_item.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';

class AddOrEditSalary extends StatefulWidget {
  static const route = '/fees/add-salary';
  const AddOrEditSalary({super.key});

  @override
  State<AddOrEditSalary> createState() => _AddOrEditSalaryState();
}

class _AddOrEditSalaryState extends State<AddOrEditSalary> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  var formKey = GlobalKey<FormState>();
  String? amount;
  late TrainerCubit trainerCubit;
  @override
  void initState() {
    trainerCubit = context.read<TrainerCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await trainerCubit.getSalaryInvoice(trainerCubit.slipDetails?.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Add InHand Salary Payments',
      ),
      body: BlocConsumer<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is AddedSalary) {
            date = null;
            dateController.text = "";
            Alert(context).show(message: state.message);
            trainerCubit.getSalaryInvoice(trainerCubit.trainerSlipDetails?.id);
          } else if (state is AddSalaryFailed) {
            Alert(context).show(message: state.message);
          } else if (state is DeletedSalary) {
            Alert(context).show(message: state.message);
            trainerCubit.getSalaryInvoice(trainerCubit.trainerSlipDetails?.id);
          } else if (state is DeleteSalaryFailed) {
            Alert(context).show(message: state.message);
          } else if (state is EditedSalary) {
            Alert(context).show(message: state.message);
            trainerCubit.getSalaryInvoice(trainerCubit.trainerSlipDetails?.id);
          } else if (state is EditSalaryFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AddingSalary ||
              state is FetchingSalaryDetails ||
              state is DeletingSalary ||
              state is EditingSalary) {
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
                        Row(
                          children: [
                            UserImage(
                              profilePic: trainerCubit.trainerSlipDetails
                                          ?.trainerDetail?.profilePic !=
                                      ""
                                  ? '${F.baseUrl}'
                                      '/admin/images/trainer/'
                                      '${trainerCubit.trainerSlipDetails?.trainerDetail?.id}/${trainerCubit.trainerSlipDetails?.trainerDetail?.profilePic}'
                                  : '',
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              "${trainerCubit.trainerSlipDetails?.trainerDetail?.name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Payment Due Date :",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 11.sp,
                                    ),
                          ),
                          Text(
                            '${trainerCubit.trainerSlipDetails?.salaryDueDate?.toDDMMMYYY()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: trainerCubit.trainerSlipDetails
                                                  ?.paymentStatus ==
                                              "paid"
                                          ? AppColors.green
                                          : trainerCubit.trainerSlipDetails
                                                      ?.paymentStatus ==
                                                  "pending"
                                              ? AppColors.primaryColor
                                              : trainerCubit.trainerSlipDetails
                                                          ?.paymentStatus ==
                                                      "partial"
                                                  ? AppColors.yellow
                                                  : AppColors.primaryColor,
                                      fontSize: 11.sp,
                                    ),
                          ),
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
                            trainerCubit.trainerSlipDetails?.writtenOffStatus !=
                                    1
                                ? trainerCubit.trainerSlipDetails
                                            ?.paymentStatus ==
                                        "paid"
                                    ? "Paid"
                                    : trainerCubit.trainerSlipDetails
                                                ?.paymentStatus ==
                                            "pending"
                                        ? "Not Paid"
                                        : trainerCubit.trainerSlipDetails
                                                    ?.paymentStatus ==
                                                "partial"
                                            ? "Partially Paid"
                                            : "Overdue"
                                : "Written off",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: trainerCubit.trainerSlipDetails
                                                  ?.writtenOffStatus !=
                                              1
                                          ? trainerCubit.trainerSlipDetails
                                                      ?.paymentStatus ==
                                                  "paid"
                                              ? AppColors.green
                                              : trainerCubit.trainerSlipDetails
                                                          ?.paymentStatus ==
                                                      "pending"
                                                  ? AppColors.primaryColor
                                                  : trainerCubit
                                                              .trainerSlipDetails
                                                              ?.paymentStatus ==
                                                          "partial"
                                                      ? AppColors.yellow
                                                      : AppColors.primaryColor
                                          : AppColors.green,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        "Salary: ₹ ${trainerCubit.trainerSlipDetails?.salaryAmount}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              if ((trainerCubit.trainerSlipDetails?.payments ?? []).isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: trainerCubit.trainerSlipDetails?.payments?.length,
                  itemBuilder: (context, index) {
                    Payment? payment =
                        trainerCubit.trainerSlipDetails?.payments?[index];
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
                              GestureDetector(
                                onTap: () {
                                  // if (payment?.isDeleted == 1 ||
                                  //     trainerCubit.trainerSlipDetails
                                  //             ?.writtenOffStatus ==
                                  //         1) {
                                  //   Alert(context).show(
                                  //       message:
                                  //           'This payment is already deleted.');
                                  // } else {
                                  CommonDialog(
                                    context: context,
                                    buttonText: 'Yes',
                                    message:
                                        'Are You Sure That You Want To Delete\nThe Salary Entered on ${payment?.paymentDate?.toDateString()}\nby ${payment?.collectedBy?.name} ?',
                                    onTap: () {
                                      Navigator.pop(context);
                                      trainerCubit.deleteSalary(
                                          slipId: trainerCubit
                                              .trainerSlipDetails?.id,
                                          paymentId: payment?.id);
                                    },
                                  ).show();
                                  // }
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // if (payment?.isDeleted == 1 ||
                                  //     trainerCubit.trainerSlipDetails
                                  //             ?.writtenOffStatus ==
                                  //         1) {
                                  //   Alert(context).show(
                                  //       message:
                                  //           'This payment is already deleted or written off');
                                  // } else {
                                  var formKey1 = GlobalKey<FormState>();
                                  String? reason, date, amount;
                                  CommonDialog(
                                    context: context,
                                    message:
                                        'Are You Sure That You Want To Edit\nThe Salary Entered on ${payment?.paymentDate?.toDateString()}\nby ${payment?.collectedBy?.name} ?',
                                    subContent: EditSalary(
                                      formKey: formKey1,
                                      reason: (value) => reason = value,
                                      amount: (value) => amount = value,
                                      date: (value) => date = value,
                                    ),
                                    onTap: () {
                                      formKey1.currentState!.save();
                                      if (formKey1.currentState!.validate()) {
                                        Navigator.pop(context);
                                        trainerCubit.editSalary({
                                          'new_date': date,
                                          'new_amount': amount,
                                          'reason': reason
                                        },
                                            slipId: trainerCubit
                                                .trainerSlipDetails?.id,
                                            paymentId: payment?.id);
                                      }
                                    },
                                  ).show();
                                  // }
                                },
                                child: Container(
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
                            rows: (payment?.edits ?? []).map((edit) {
                              return DataRow(
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
                                                "${edit.previousDate?.toDateString()}",
                                                style: TextStyle(
                                                    color: AppColors.grey700,
                                                    decorationThickness: 2.85,
                                                    decoration: TextDecoration
                                                        .lineThrough),
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
                                            "${edit.editedBy?.name}",
                                            style: TextStyle(
                                                color: AppColors.grey700,
                                                decorationThickness: 2.85,
                                                decoration:
                                                    TextDecoration.lineThrough),
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
                                                "${edit.previousAmount}",
                                                style: TextStyle(
                                                    color: AppColors.grey700,
                                                    decorationThickness: 2.85,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              );
                            }).toList()
                              ..add(
                                payment?.isDeleted == 1
                                    ? DataRow(
                                        cells: [
                                          DataCell(
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              child: CustomPaint(
                                                  painter:
                                                      DottedBorderPainter(),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Text(
                                                        "${payment?.paymentDate?.toDateString()}",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .grey700,
                                                            decorationThickness:
                                                                2.85,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          DataCell(
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              child: CustomPaint(
                                                painter: DottedBorderPainter(),
                                                child: Center(
                                                  child: Text(
                                                    "${payment?.collectedBy?.name}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grey700,
                                                        decorationThickness:
                                                            2.85,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              child: CustomPaint(
                                                  painter:
                                                      DottedBorderPainter(),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        "${payment?.amount}",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .grey700,
                                                            decorationThickness:
                                                                2.85,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    : DataRow(
                                        cells: [
                                          DataCell(
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              child: CustomPaint(
                                                  painter:
                                                      DottedBorderPainter(),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              child: CustomPaint(
                                                  painter:
                                                      DottedBorderPainter(),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        "${payment?.amount}",
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                          ),
                          if (payment?.isEdited == 1)
                            SizedBox(
                              width:
                                  (3 * MediaQuery.of(context).size.width) / 3.5,
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    "${payment?.edits?[(payment.edits?.length ?? 0) - 1].reason}",
                                    maxLines: 5,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: payment?.isDeleted == 1
                                                ? AppColors.grey700
                                                : null,
                                            decoration: payment?.isDeleted == 1
                                                ? TextDecoration.lineThrough
                                                : null),
                                  ),
                                ),
                              ),
                            ),
                          if (payment?.isDeleted == 1)
                            SizedBox(
                              width:
                                  (3 * MediaQuery.of(context).size.width) / 3.5,
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    "Payment has been deleted by ${payment?.deletedBy?.name}",
                                    maxLines: 5,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ),
                              ),
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
                            text:
                                '₹${trainerCubit.trainerSlipDetails?.pendingAmount}',
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
              if (trainerCubit.trainerSlipDetails?.paymentStatus != "paid")
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CommonField(
                        inputType: const TextInputType.numberWithOptions(),
                        length: 50,
                        title: 'Amount Paid *',
                        hint: 'Enter amount paid',
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.none,
                              onTap: () async {
                                await datePicker();
                                dateController.text =
                                    date?.toDateString() ?? "";
                              },
                              readOnly: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Please enter date';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7)),
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 24,
                                  color: Colors.white24,
                                ),
                                hintText: 'Select the date',
                                fillColor: AppColors.liteDark,
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: Button(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  trainerCubit.addSalary(
                                      trainerCubit.trainerSlipDetails?.id, {
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
