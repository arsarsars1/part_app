import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';

class SalaryListItem extends StatefulWidget {
  final Data salary;
  final VoidCallback onTap;

  const SalaryListItem({super.key, required this.salary, required this.onTap});

  @override
  State<SalaryListItem> createState() => _FeeListItemState();
}

class _FeeListItemState extends State<SalaryListItem> {
  bool isShrunk = true;

  @override
  Widget build(BuildContext context) {
    var trainerCubit = context.read<TrainerCubit>();
    return ListTile(
      title: isShrunk
          ? GestureDetector(
              onTap: () {
                setState(() {
                  isShrunk = !isShrunk;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 20.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.h),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.salary.writtenOffStatus != 1
                              ? widget.salary.paymentStatus == 'paid'
                                  ? AppColors.green
                                  : widget.salary.paymentStatus == 'partial'
                                      ? AppColors.yellow
                                      : AppColors.red
                              : AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.liteDark,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                UserImage(
                                  profilePic: widget.salary.trainerDetail
                                              ?.profilePic !=
                                          ""
                                      ? '${F.baseUrl}'
                                          '/admin/images/trainer/'
                                          '${widget.salary.trainerDetail?.id}/${widget.salary.trainerDetail?.profilePic}'
                                      : '',
                                ),
                                SizedBox(width: 16.w),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${widget.salary.trainerDetail?.name}',
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (widget.salary.writtenOffStatus != 1 &&
                                    widget.salary.paymentStatus != "paid")
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Payment Due Date:',
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                      Text(
                                        "${widget.salary.salaryDueDate?.toDDMMYYY()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: widget.salary
                                                          .writtenOffStatus !=
                                                      1
                                                  ? widget.salary
                                                              .paymentStatus ==
                                                          'paid'
                                                      ? AppColors.green
                                                      : widget.salary
                                                                  .paymentStatus ==
                                                              'partial'
                                                          ? AppColors.yellow
                                                          : AppColors
                                                              .primaryColor
                                                  : AppColors.green,
                                            ),
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                Text(
                                  'Payment Status:',
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                                Text(
                                  widget.salary.writtenOffStatus != 1
                                      ? widget.salary.paymentStatus == 'paid'
                                          ? "Completely Paid"
                                          : widget.salary.paymentStatus ==
                                                  'partial'
                                              ? "Partially Paid"
                                              : "Not Paid"
                                      : "Written Off",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: widget.salary.writtenOffStatus !=
                                                1
                                            ? widget.salary.paymentStatus ==
                                                    'paid'
                                                ? AppColors.green
                                                : widget.salary.paymentStatus ==
                                                        'partial'
                                                    ? AppColors.yellow
                                                    : AppColors.primaryColor
                                            : AppColors.green,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Salary : ${widget.salary.salaryAmount}',
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if ((widget.salary.payments ?? []).isNotEmpty)
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
                                        MediaQuery.of(context).size.width / 4.w,
                                    child: CustomPaint(
                                        painter: DottedBorderPainter(),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
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
                                        MediaQuery.of(context).size.width / 3,
                                    child: CustomPaint(
                                      painter: DottedBorderPainter(),
                                      child: Center(
                                        child: Text(
                                          'Payment Method',
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
                                        MediaQuery.of(context).size.width / 4.w,
                                    child: CustomPaint(
                                        painter: DottedBorderPainter(),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
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
                              rows: (widget.salary.payments ?? []).map(
                                (payment) {
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.w,
                                          child: CustomPaint(
                                              painter: DottedBorderPainter(),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: payment.isDeleted != 1
                                                      ? Text(
                                                          "${payment.paymentDate?.toDateString()}",
                                                          style: TextStyle(
                                                              fontSize: 11.sp),
                                                        )
                                                      : Text(
                                                          "${payment.paymentDate?.toDateString()}",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
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
                                              3,
                                          child: CustomPaint(
                                            painter: DottedBorderPainter(),
                                            child: Center(
                                              child: payment.isDeleted != 1
                                                  ? Text(
                                                      payment.paymentMethod ==
                                                              "cash"
                                                          ? "In Hand Payment"
                                                          : "${payment.paymentMethod}",
                                                    )
                                                  : Text(
                                                      payment.paymentMethod ==
                                                              "cash"
                                                          ? "In Hand Payment"
                                                          : "${payment.paymentMethod}",
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
                                              4.w,
                                          child: CustomPaint(
                                              painter: DottedBorderPainter(),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5.0),
                                                  child: payment.isDeleted != 1
                                                      ? Text(
                                                          "₹ ${payment.amount}",
                                                          style: TextStyle(
                                                              fontSize: 11.sp),
                                                        )
                                                      : Text(
                                                          "₹ ${payment.amount}",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
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
                                  );
                                },
                              ).toList()),
                        if ((widget.salary.payments ?? []).isNotEmpty)
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) / 3 +
                                (2 * (MediaQuery.of(context).size.width) / 4.w),
                            child: CustomPaint(
                              painter: DottedBorderPainter(),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total Amount Paid:   ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                    Text(
                                      (widget.salary.paymentsTotal ?? [])
                                              .isNotEmpty
                                          ? "₹ ${widget.salary.paymentsTotal?[0].total}"
                                          : "₹ 0.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: (widget.salary
                                                            .paymentsTotal ??
                                                        [])
                                                    .isNotEmpty
                                                ? (widget
                                                            .salary
                                                            .paymentsTotal?[0]
                                                            .total ==
                                                        widget.salary
                                                            .salaryAmount)
                                                    ? AppColors.green
                                                    : AppColors.primaryColor
                                                : AppColors.primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if ((widget.salary.payments ?? []).isNotEmpty)
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) / 3 +
                                (2 * (MediaQuery.of(context).size.width) / 4.w),
                            child: CustomPaint(
                              painter: DottedBorderPainter(),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Amount Payable:   ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                    Text(
                                      "₹ ${widget.salary.pendingAmount}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                widget.salary.pendingAmount ==
                                                        "0"
                                                    ? AppColors.green
                                                    : AppColors.primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if ((widget.salary.payments ?? []).isNotEmpty)
                          SizedBox(
                            height: 20.h,
                          ),
                        if (widget.salary.paymentStatus != "paid")
                          if (widget.salary.writtenOffStatus != 1)
                            Column(
                              children: [
                                LargeButton(
                                  title: 'Pay Salary Via UPI',
                                  onTap: () {
                                    Alert(context)
                                        .show(message: "Coming soon !!");
                                  },
                                  color: AppColors.primaryColor,
                                  margin: 0,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                        LargeButton(
                          title: 'Add In Hand Salary',
                          onTap: widget.onTap,
                          color: AppColors.defaultBlue,
                          margin: 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (widget.salary.paymentStatus != "paid")
                          if (widget.salary.writtenOffStatus != 1)
                            Column(
                              children: [
                                LargeButton(
                                  title: 'Close Salary',
                                  onTap: () {
                                    var formKey1 = GlobalKey<FormState>();
                                    String? reason;
                                    CommonDialog(
                                      context: context,
                                      message:
                                          'Are You Sure That You Want To Close\nSalary Of Trainer For The Month ?',
                                      subContent: Column(
                                        children: [
                                          Text(
                                            "₹ ${widget.salary.pendingAmount} /-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "${widget.salary.trainerDetail?.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          Text(
                                            "${widget.salary.salaryDueDate?.toMMMMYYYY()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Form(
                                            key: formKey1,
                                            child: Column(
                                              children: [
                                                CommonField(
                                                  title:
                                                      'Remark/Reason For Closing *',
                                                  hint: 'Eg: School Final Exam',
                                                  maxLines: 2,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  onChange: (value) {
                                                    reason = value;
                                                  },
                                                  validator: (value) {
                                                    return value
                                                            .toString()
                                                            .trim()
                                                            .isEmpty
                                                        ? 'please enter the reason'
                                                        : null;
                                                  },
                                                ),
                                                const SizedBox(height: 16),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        formKey1.currentState!.save();
                                        if (formKey1.currentState!.validate()) {
                                          Navigator.pop(context);
                                          trainerCubit.closeOffSalary(
                                            {'written_off_remarks': reason},
                                            slipId: widget.salary.id,
                                          );
                                        }
                                      },
                                    ).show();
                                  },
                                  color: AppColors.lavender,
                                  margin: 0,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                        isShrunk
                            ? Icon(
                                Icons.expand_less,
                                color: AppColors.textColor,
                              )
                            : Icon(
                                Icons.expand_more,
                                color: AppColors.textColor,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  isShrunk = !isShrunk;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 20.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.h),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.salary.writtenOffStatus != 1
                              ? widget.salary.paymentStatus == 'paid'
                                  ? AppColors.green
                                  : widget.salary.paymentStatus == 'partial'
                                      ? AppColors.yellow
                                      : AppColors.red
                              : AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.liteDark,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            UserImage(
                              profilePic: widget
                                          .salary.trainerDetail?.profilePic !=
                                      ""
                                  ? '${F.baseUrl}'
                                      '/admin/images/trainer/'
                                      '${widget.salary.trainerDetail?.id}/${widget.salary.trainerDetail?.profilePic}'
                                  : '',
                            ),
                            SizedBox(width: 16.w),
                            SizedBox(
                              width: 100,
                              child: Text(
                                '${widget.salary.trainerDetail?.name}',
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Due Date: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColors.textColor,
                                      ),
                                ),
                                Text(
                                  "${widget.salary.salaryDueDate?.toDDMMMYYY()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: widget.salary.writtenOffStatus !=
                                                1
                                            ? widget.salary.paymentStatus ==
                                                    'paid'
                                                ? AppColors.green
                                                : widget.salary.paymentStatus ==
                                                        'partial'
                                                    ? AppColors.yellow
                                                    : AppColors.primaryColor
                                            : AppColors.green,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              widget.salary.writtenOffStatus != 1
                                  ? widget.salary.paymentStatus == 'paid'
                                      ? "Completely Paid"
                                      : widget.salary.paymentStatus == 'partial'
                                          ? "Partially Paid"
                                          : "Not Paid"
                                  : "Written Off",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: widget.salary.writtenOffStatus != 1
                                        ? widget.salary.paymentStatus == 'paid'
                                            ? AppColors.green
                                            : widget.salary.paymentStatus ==
                                                    'partial'
                                                ? AppColors.yellow
                                                : AppColors.primaryColor
                                        : AppColors.green,
                                  ),
                            ),
                          ],
                        ),
                        isShrunk
                            ? Icon(
                                Icons.expand_less,
                                color: AppColors.textColor,
                              )
                            : Icon(
                                Icons.expand_more,
                                color: AppColors.textColor,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.textColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    const dotSpacing = 4.0;
    final dotsPerWidth = (size.width / dotSpacing).ceil();
    final dotsPerHeight = (size.height / dotSpacing).ceil();

    // Draw the top line
    for (int i = 0; i < dotsPerWidth; i++) {
      final dx = i * dotSpacing;
      path.moveTo(dx, 0);
      path.lineTo(dx + dotSpacing / 2, 0);
    }

    // Draw the right line
    for (int i = 0; i < dotsPerHeight; i++) {
      final dy = i * dotSpacing;
      path.moveTo(size.width, dy);
      path.lineTo(size.width, dy + dotSpacing / 2);
    }

    // Draw the bottom line
    for (int i = dotsPerWidth - 1; i >= 0; i--) {
      final dx = i * dotSpacing;
      path.moveTo(dx + dotSpacing / 2, size.height);
      path.lineTo(dx, size.height);
    }

    // Draw the left line
    for (int i = dotsPerHeight - 1; i >= 0; i--) {
      final dy = i * dotSpacing;
      path.moveTo(0, dy + dotSpacing / 2);
      path.lineTo(0, dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
