import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/student_app_fee_detail_history.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view_model/cubits.dart';

class StudentAppFeeListItem extends StatefulWidget {
  final Invoice invoice;
  final bool isFromAdmission;
  final VoidCallback onTap;

  const StudentAppFeeListItem({
    super.key,
    this.isFromAdmission = false,
    required this.invoice,
    required this.onTap,
  });

  @override
  State<StudentAppFeeListItem> createState() => _StudentAppFeeListItemState();
}

class _StudentAppFeeListItemState extends State<StudentAppFeeListItem> {
  bool isShrunk = true;

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
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
                          color: widget.invoice.writtenOffStatus != 1
                              ? widget.invoice.paymentStatus == 'paid'
                                  ? AppColors.green
                                  : widget.invoice.paymentStatus == 'partial'
                                      ? AppColors.yellow
                                      : AppColors.red
                              : AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.liteDark,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                UserImage(
                                  profilePic: widget.invoice.studentDetail!
                                              .profilePic !=
                                          ""
                                      ? '${F.baseUrl}'
                                          '/students/${authCubit.user?.studentDetail?[authCubit.studentIndex].id}/images/profile-pic/'
                                          '${widget.invoice.studentDetail?.profilePic}'
                                      : '',
                                ),
                                SizedBox(width: 16.w),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${widget.invoice.studentDetail?.name}',
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
                                Text(
                                  widget.invoice.feeType == 'monthly'
                                      ? 'Monthly'
                                      : 'Class Based',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color:
                                            widget.invoice.feeType == 'monthly'
                                                ? AppColors.primaryColor
                                                : AppColors.green,
                                      ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                if (widget.invoice.feeType == "class")
                                  Text(
                                    "Class Attended: ${widget.invoice.cycleAttendancePresentCount}/${widget.invoice.totalNoOfClasses}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.invoice.batchName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(),
                                          ),
                                          Text(
                                            '${widget.invoice.branchName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                          Text(
                                            '${widget.invoice.courseName}, ${widget.invoice.subjectName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(),
                                          ),
                                        ]),
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (widget.invoice.writtenOffStatus !=
                                                  1 &&
                                              widget.invoice.paymentStatus !=
                                                  'paid')
                                            if (widget.invoice.feeType ==
                                                "monthly")
                                              Text(
                                                'Payment Due Date:',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(),
                                              ),
                                          if (widget.invoice.writtenOffStatus !=
                                                  1 &&
                                              widget.invoice.paymentStatus !=
                                                  'paid')
                                            if (widget.invoice.feeType ==
                                                "monthly")
                                              Text(
                                                "${widget.invoice.paymentDueDate?.toDDMMMYYY()}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      fontSize: 13,
                                                      color: widget.invoice
                                                                  .writtenOffStatus !=
                                                              1
                                                          ? widget.invoice
                                                                      .paymentStatus ==
                                                                  'paid'
                                                              ? AppColors.green
                                                              : widget.invoice
                                                                          .paymentStatus ==
                                                                      'partial'
                                                                  ? AppColors
                                                                      .yellow
                                                                  : AppColors
                                                                      .primaryColor
                                                          : AppColors.green,
                                                    ),
                                              ),
                                          Text(
                                            "Payment Status :",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(),
                                          ),
                                          Text(
                                            widget.invoice.writtenOffStatus != 1
                                                ? widget.invoice
                                                            .paymentStatus ==
                                                        'paid'
                                                    ? "Completely Paid"
                                                    : widget.invoice
                                                                .paymentStatus ==
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
                                                  color: widget.invoice
                                                              .writtenOffStatus !=
                                                          1
                                                      ? widget.invoice
                                                                  .paymentStatus ==
                                                              'paid'
                                                          ? AppColors.green
                                                          : widget.invoice
                                                                      .paymentStatus ==
                                                                  'partial'
                                                              ? AppColors.yellow
                                                              : AppColors
                                                                  .primaryColor
                                                      : AppColors.green,
                                                ),
                                          ),
                                        ]),
                                  )
                                ]),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Fees :  ₹${widget.invoice.payableAmount}',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            (widget.invoice.payments ?? []).isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DataTable(
                                        headingRowHeight: 30.h,
                                        dataRowMinHeight: 30.h,
                                        dataRowMaxHeight: 30.h,
                                        columnSpacing: 0.0,
                                        horizontalMargin: 0.0,
                                        columns: [
                                          DataColumn(
                                            label: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
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
                                                        'Date',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: CustomPaint(
                                                painter: DottedBorderPainter(),
                                                child: Center(
                                                  child: Text(
                                                    'Updated By',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
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
                                                        'Amount',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                        rows: (widget.invoice.payments ?? [])
                                            .map((row) {
                                          return DataRow(cells: [
                                            DataCell(
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: CustomPaint(
                                                    painter:
                                                        DottedBorderPainter(),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5.0),
                                                        child:
                                                            row.isDeleted != 1
                                                                ? Text(
                                                                    "${row.paymentDate?.toDateString()}",
                                                                  )
                                                                : Text(
                                                                    "${row.paymentDate?.toDateString()}",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .grey700,
                                                                        decorationThickness:
                                                                            2.85,
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
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
                                                  painter:
                                                      DottedBorderPainter(),
                                                  child: Center(
                                                    child: row.isDeleted != 1
                                                        ? Text(
                                                            "${row.collectedBy?.name}",
                                                          )
                                                        : Text(
                                                            "${row.collectedBy?.name}",
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
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: CustomPaint(
                                                    painter:
                                                        DottedBorderPainter(),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 5.0),
                                                        child:
                                                            row.isDeleted != 1
                                                                ? Text(
                                                                    "₹ ${row.amount}",
                                                                  )
                                                                : Text(
                                                                    "₹ ${row.amount}",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .grey700,
                                                                        decorationThickness:
                                                                            2.85,
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                                  ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ]);
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                        width: (2 *
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5)) +
                                            (MediaQuery.of(context).size.width /
                                                3),
                                        child: CustomPaint(
                                          painter: DottedBorderPainter(),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Total Amount Paid : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(),
                                                ),
                                                // Text(
                                                //   (widget.invoice.paymentsTotal ??
                                                //               [])
                                                //           .isNotEmpty
                                                //       ? "₹ ${widget.invoice.paymentsTotal?[0].total}"
                                                //       : "₹ 0.00",
                                                //   style:
                                                //       Theme.of(context)
                                                //           .textTheme
                                                //           .bodyLarge
                                                //           ?.copyWith(
                                                //             color: (widget.invoice
                                                //                             .paymentsTotal ??
                                                //                         [])
                                                //                     .isNotEmpty
                                                //                 ? (widget.invoice.paymentsTotal?[0].total ==
                                                //                         widget
                                                //                             .student
                                                //                             .payableAmount)
                                                //                     ? AppColors
                                                //                         .green
                                                //                     : AppColors
                                                //                         .primaryColor
                                                //                 : AppColors
                                                //                     .primaryColor,
                                                //           ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                        width: (2 *
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5)) +
                                            (MediaQuery.of(context).size.width /
                                                3),
                                        child: CustomPaint(
                                          painter: DottedBorderPainter(),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Amount Payable : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(),
                                                ),
                                                Text(
                                                  '₹ ${widget.invoice.pendingAmount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: widget.invoice
                                                                    .pendingAmount ==
                                                                "0"
                                                            ? AppColors.green
                                                            : AppColors
                                                                .primaryColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0.h,
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
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
          : Padding(
              padding: EdgeInsets.all(16.h),
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
                          color: widget.invoice.writtenOffStatus != 1
                              ? widget.invoice.paymentStatus == 'paid'
                                  ? AppColors.green
                                  : widget.invoice.paymentStatus == 'partial'
                                      ? AppColors.yellow
                                      : AppColors.red
                              : AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isShrunk = !isShrunk;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.liteDark,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  UserImage(
                                    profilePic: widget.invoice.studentDetail!
                                                .profilePic !=
                                            ""
                                        ? '${F.baseUrl}'
                                            '/admin/images/student/'
                                            '${widget.invoice.studentDetail!.id}/${widget.invoice.studentDetail?.profilePic}'
                                        : '',
                                  ),
                                  SizedBox(width: 16.w),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      '${widget.invoice.studentDetail?.name}',
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
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.invoice.writtenOffStatus != 1 &&
                                      widget.invoice.paymentStatus != 'paid'
                                  ? widget.invoice.feeType == "monthly"
                                      ? Text(
                                          'Due Date: ${widget.invoice.paymentDueDate?.toDateString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.textColor,
                                              ),
                                        )
                                      : Text(
                                          'Due in: ${10 - (widget.invoice.monthClassesConductedCount ?? 0)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.textColor,
                                              ),
                                        )
                                  : Text(
                                      '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.textColor,
                                          ),
                                    ),
                              Text(
                                widget.invoice.writtenOffStatus != 1
                                    ? widget.invoice.paymentStatus == 'paid'
                                        ? "Completely Paid"
                                        : widget.invoice.paymentStatus ==
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
                                      color: widget.invoice.writtenOffStatus !=
                                              1
                                          ? widget.invoice.paymentStatus ==
                                                  'paid'
                                              ? AppColors.green
                                              : widget.invoice.paymentStatus ==
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
