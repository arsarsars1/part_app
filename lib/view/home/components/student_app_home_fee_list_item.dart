import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/student_dashboard.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

class StudentAppHomeFeeListItem extends StatefulWidget {
  final BatchFeeInvoice? fee;
  final bool isFromAdmission;
  final VoidCallback onTap;

  const StudentAppHomeFeeListItem({
    Key? key,
    this.isFromAdmission = false,
    required this.fee,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StudentAppHomeFeeListItem> createState() =>
      _StudentAppHomeFeeListItemState();
}

class _StudentAppHomeFeeListItemState extends State<StudentAppHomeFeeListItem> {
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
              child: Padding(
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
                            color: widget.fee?.writtenOffStatus != 1
                                ? widget.fee?.paymentStatus == 'paid'
                                    ? AppColors.green
                                    : widget.fee?.paymentStatus == 'partial'
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
                                    profilePic: widget.fee?.studentDetail!
                                                .profilePic !=
                                            ""
                                        ? '${F.baseUrl}'
                                            '/students/${authCubit.user?.studentDetail?[authCubit.studentIndex].id}/images/profile-pic/'
                                            '${widget.fee?.studentDetail?.profilePic}'
                                        : '',
                                  ),
                                  SizedBox(width: 16.w),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      '${widget.fee?.studentDetail?.name}',
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
                                    widget.fee?.feeType == 'monthly'
                                        ? 'Monthly'
                                        : 'Class Based',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color:
                                              widget.fee?.feeType == 'monthly'
                                                  ? AppColors.primaryColor
                                                  : AppColors.green,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  if (widget.fee?.feeType == "class")
                                    Text(
                                      "Class Attended: ${widget.fee?.cycleAttendancePresentCount}/${widget.fee?.totalNoOfClasses}",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      '${widget.fee?.batchName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
                                  ),
                                  if (widget.fee?.writtenOffStatus != 1 &&
                                      widget.fee?.paymentStatus != 'paid')
                                    if (widget.fee?.feeType == "monthly")
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Payment Due Date:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(),
                                          ),
                                          Text(
                                            "${widget.fee?.paymentDueDate?.toDDMMMYYY()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontSize: 13,
                                                  color: widget.fee
                                                              ?.writtenOffStatus !=
                                                          1
                                                      ? widget.fee?.paymentStatus ==
                                                              'paid'
                                                          ? AppColors.green
                                                          : widget.fee?.paymentStatus ==
                                                                  'partial'
                                                              ? AppColors.yellow
                                                              : AppColors
                                                                  .primaryColor
                                                      : AppColors.green,
                                                ),
                                          )
                                        ],
                                      ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  '${widget.fee?.branchName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${widget.fee?.courseName}, ${widget.fee?.subjectName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Payment Status :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.fee?.writtenOffStatus != 1
                                        ? widget.fee?.paymentStatus == 'paid'
                                            ? "Completely Paid"
                                            : widget.fee?.paymentStatus ==
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
                                          color: widget.fee?.writtenOffStatus !=
                                                  1
                                              ? widget.fee?.paymentStatus ==
                                                      'paid'
                                                  ? AppColors.green
                                                  : widget.fee?.paymentStatus ==
                                                          'partial'
                                                      ? AppColors.yellow
                                                      : AppColors.primaryColor
                                              : AppColors.green,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Fees :  ₹${widget.fee?.payableAmount}',
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              (widget.fee?.payments ?? []).isNotEmpty
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
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5.0),
                                                        child: Text(
                                                          'Date',
                                                          style:
                                                              Theme.of(context)
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
                                                  painter:
                                                      DottedBorderPainter(),
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
                                                            const EdgeInsets
                                                                .only(
                                                                right: 5.0),
                                                        child: Text(
                                                          'Amount',
                                                          style:
                                                              Theme.of(context)
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
                                          rows: (widget.fee?.payments ?? [])
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
                                                        alignment: Alignment
                                                            .centerLeft,
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
                                                        alignment: Alignment
                                                            .centerRight,
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
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3),
                                          child: CustomPaint(
                                            painter: DottedBorderPainter(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                  //   (widget.student.paymentsTotal ??
                                                  //               [])
                                                  //           .isNotEmpty
                                                  //       ? "₹ ${widget.student.paymentsTotal?[0].total}"
                                                  //       : "₹ 0.00",
                                                  //   style:
                                                  //       Theme.of(context)
                                                  //           .textTheme
                                                  //           .bodyLarge
                                                  //           ?.copyWith(
                                                  //             color: (widget.student
                                                  //                             .paymentsTotal ??
                                                  //                         [])
                                                  //                     .isNotEmpty
                                                  //                 ? (widget.student.paymentsTotal?[0].total ==
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
                                              (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3),
                                          child: CustomPaint(
                                            painter: DottedBorderPainter(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                    '₹ ${widget.fee?.pendingAmount}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: widget.fee
                                                                      ?.pendingAmount ==
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
                          color: widget.fee?.writtenOffStatus != 1
                              ? widget.fee?.paymentStatus == 'paid'
                                  ? AppColors.green
                                  : widget.fee?.paymentStatus == 'partial'
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
                                    profilePic: widget.fee?.studentDetail!
                                                .profilePic !=
                                            ""
                                        ? '${F.baseUrl}'
                                            '/admin/images/student/'
                                            '${widget.fee?.studentDetail!.id}/${widget.fee?.studentDetail?.profilePic}'
                                        : '',
                                  ),
                                  SizedBox(width: 16.w),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      '${widget.fee?.studentDetail?.name}',
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
                              widget.fee?.writtenOffStatus != 1 &&
                                      widget.fee?.paymentStatus != 'paid'
                                  ? widget.fee?.feeType == "monthly"
                                      ? Text(
                                          'Due Date: ${widget.fee?.paymentDueDate?.toDateString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.textColor,
                                              ),
                                        )
                                      : Text(
                                          'Due in: ${10 - (widget.fee?.monthClassesConductedCount ?? 0)}',
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
                                widget.fee?.writtenOffStatus != 1
                                    ? widget.fee?.paymentStatus == 'paid'
                                        ? "Completely Paid"
                                        : widget.fee?.paymentStatus == 'partial'
                                            ? "Partially Paid"
                                            : "Not Paid"
                                    : "Written Off",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: widget.fee?.writtenOffStatus != 1
                                          ? widget.fee?.paymentStatus == 'paid'
                                              ? AppColors.green
                                              : widget.fee?.paymentStatus ==
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
