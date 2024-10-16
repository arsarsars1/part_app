import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/admission_fee_invoice.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/fee/components/edit_fees.dart';
import 'package:part_app/view/fee/components/fee_list_item.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class AddOrEditAdmissionFees extends StatefulWidget {
  static const route = '/fees/add-admission-fees';
  const AddOrEditAdmissionFees({super.key});

  @override
  State<AddOrEditAdmissionFees> createState() => _AddOrEditFeesState();
}

class _AddOrEditFeesState extends State<AddOrEditAdmissionFees> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  DateTime? date;
  var formKey = GlobalKey<FormState>();
  DropDownItem? paymentMethodValue;
  late FeeCubit feeCubit;

  @override
  void initState() {
    feeCubit = context.read<FeeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await feeCubit.getAdmissionInvoice(feeCubit.student.id);
      feesController.text = feeCubit.admissionFeeInvoice?.pendingAmount ?? "";
      dateController.text = DateTime.now().toDateString();
      await feeCubit.getPaymentMethod();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Edit Admission Fee Details',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) async {
          if (state is AddedFees) {
            date = null;
            dateController.text = "";
            Alert(context).show(message: state.message);
            await feeCubit.getAdmissionInvoice(feeCubit.student.id);
            feesController.text =
                feeCubit.admissionFeeInvoice?.pendingAmount ?? "";
            dateController.text = DateTime.now().toDateString();
          } else if (state is AddFeesFailed) {
            Alert(context).show(message: state.message);
          } else if (state is FeesDeleted) {
            Alert(context).show(message: state.message);
            await feeCubit.getAdmissionInvoice(feeCubit.student.id);
            feesController.text =
                feeCubit.admissionFeeInvoice?.pendingAmount ?? "";
            dateController.text = DateTime.now().toDateString();
          } else if (state is DeleteFeesFailed) {
            Alert(context).show(message: state.message);
          } else if (state is EdittedFee) {
            Alert(context).show(message: state.message);
            await feeCubit.getAdmissionInvoice(feeCubit.student.id);
            feesController.text =
                feeCubit.admissionFeeInvoice?.pendingAmount ?? "";
            dateController.text = DateTime.now().toDateString();
          } else if (state is EditFeesFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AddingFees ||
              state is GettingBatchInvoice ||
              state is DeletingFees ||
              state is EditingFee) {
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
                          "${feeCubit.admissionFeeInvoice?.studentDetail?.name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                        ),
                        Text(
                          feeCubit.admissionFeeInvoice?.feeType == "monthly"
                              ? "Monthly"
                              : "Class Based",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.green,
                                    fontSize: 11.sp,
                                  ),
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
                            SizedBox(
                              width: 200,
                              child: Text(
                                "${feeCubit.admissionFeeInvoice?.batchName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 11.sp,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "${feeCubit.admissionFeeInvoice?.branchName}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 11.sp,
                                    ),
                              ),
                            ),
                            Text(
                              "${feeCubit.admissionFeeInvoice?.courseName}, ${feeCubit.admissionFeeInvoice?.subjectName}",
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
                            feeCubit.admissionFeeInvoice?.writtenOffStatus == 0
                                ? feeCubit.admissionFeeInvoice?.paymentStatus ==
                                        "paid"
                                    ? "Paid"
                                    : feeCubit.admissionFeeInvoice
                                                ?.paymentStatus ==
                                            "pending"
                                        ? "Not Paid"
                                        : feeCubit.admissionFeeInvoice
                                                    ?.paymentStatus ==
                                                "partial"
                                            ? "Partially Paid"
                                            : "Overdue"
                                : "Written Off",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: feeCubit.admissionFeeInvoice
                                                  ?.writtenOffStatus ==
                                              0
                                          ? feeCubit.admissionFeeInvoice
                                                      ?.paymentStatus ==
                                                  "paid"
                                              ? AppColors.green
                                              : feeCubit.admissionFeeInvoice
                                                          ?.paymentStatus ==
                                                      "pending"
                                                  ? AppColors.primaryColor
                                                  : feeCubit.admissionFeeInvoice
                                                              ?.paymentStatus ==
                                                          "partial"
                                                      ? AppColors.yellow
                                                      : AppColors.primaryColor
                                          : AppColors.green,
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
                      "Fees: ₹${feeCubit.admissionFeeInvoice?.payableAmount}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
              ),
              if ((feeCubit.admissionFeeInvoice?.payments ?? []).isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: feeCubit.admissionFeeInvoice?.payments?.length,
                  itemBuilder: (context, index) {
                    Payment? payment =
                        feeCubit.admissionFeeInvoice?.payments?[index];
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
                                  if (payment?.isDeleted == 1) {
                                    Alert(context).show(
                                        message:
                                            'This payment is already deleted.');
                                  } else {
                                    CommonDialog(
                                      context: context,
                                      buttonText: 'Yes',
                                      message:
                                          'Are You Sure That You Want To Delete\nThe Admission Fees Entered on ${payment?.paymentDate?.toDateString()}\nby ${payment?.collectedBy?.name} ?',
                                      onTap: () {
                                        Navigator.pop(context);
                                        feeCubit.deleteAdmissionFees(
                                            admissionFeeInvoiceId: feeCubit
                                                .admissionFeeInvoice?.id,
                                            paymentId: payment?.id);
                                      },
                                    ).show();
                                  }
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
                                  if (payment?.isDeleted == 1) {
                                    Alert(context).show(
                                        message:
                                            'This payment is already deleted.');
                                  } else {
                                    var formKey1 = GlobalKey<FormState>();
                                    String? reason, date, amount;
                                    DropDownItem? paymentValue;
                                    CommonDialog(
                                      context: context,
                                      message:
                                          'Are You Sure That You Want To Edit\nThe Admission Fees Entered on ${payment?.paymentDate?.toDateString()}\nby ${payment?.collectedBy?.name} ?',
                                      subContent: EditFees(
                                        formKey: formKey1,
                                        reason: (value) => reason = value,
                                        amount: (value) => amount = value,
                                        date: (value) => date = value,
                                        payment: (value) =>
                                            paymentValue = value,
                                      ),
                                      onTap: () {
                                        formKey1.currentState!.save();
                                        if (formKey1.currentState!.validate()) {
                                          Navigator.pop(context);
                                          feeCubit.editAdmissionFees({
                                            'new_date': date,
                                            'new_amount': amount,
                                            'payment_method':
                                                paymentValue?.item,
                                            'reason': reason
                                          },
                                              admissionFeeInvoiceId: feeCubit
                                                  .admissionFeeInvoice?.id,
                                              paymentId: payment?.id);
                                        }
                                      },
                                    ).show();
                                  }
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
                              return DataRow(cells: [
                                DataCell(
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
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
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
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
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
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
                              ]);
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
                                    "${payment?.edits?[(payment.edits?.length ?? 0) - 1].reason} ( Edited by ${payment?.edits?[(payment.edits?.length ?? 0) - 1].editedBy?.name} )",
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
                                '₹${feeCubit.admissionFeeInvoice?.pendingAmount}',
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
                      controller: feesController,
                      title: 'Admission Fees *',
                      hint: 'Enter admission Fees',
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter admission fees';
                        }
                        return null;
                      },
                      onChange: (value) {},
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
                              dateController.text = date?.toDateString() ?? "";
                            },
                            readOnly: true,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Please enter date';
                              } else {
                                return null;
                              }
                            },
                            style:
                                TextStyle(color: Colors.white.withOpacity(.7)),
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
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CommonField(
                          title: 'Payment Mode',
                          hint: 'Select payment mode',
                          length: 50,
                          maxLines: 1,
                          dropDown: true,
                          defaultItem: paymentMethodValue,
                          dropDownItems: feeCubit
                              .paymentMethodModel?.paymentMethods
                              .map(
                                  (e) => DropDownItem(id: e, title: e, item: e))
                              .toList(),
                          textInputAction: TextInputAction.next,
                          onChange: (value) {
                            paymentMethodValue = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                    Center(
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Button(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await feeCubit.addFeesForAdmission(
                                    feeCubit.admissionFeeInvoice?.id, {
                                  'amount': feesController.text,
                                  'payment_method': paymentMethodValue?.title,
                                  'payment_date':
                                      dateController.text.toDateServerString()
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
