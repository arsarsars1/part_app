import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/dialog.dart';
import 'package:part_app/view/components/fee_reminder_button.dart';
import 'package:part_app/view/components/large_button.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/fee/add_or_edit_fees.dart';
import 'package:part_app/view/fee/components/write_off_fees.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';
import '../../../flavors.dart';
import '../../../model/data_model/batch_fee_invoice_list.dart';

class FeeListItem extends StatefulWidget {
  final Datum student;
  final VoidCallback onTap;

  const FeeListItem({Key? key, required this.student, required this.onTap})
      : super(key: key);

  @override
  State<FeeListItem> createState() => _FeeListItemState();
}

class _FeeListItemState extends State<FeeListItem> {
  bool isShrunk = true;

  @override
  Widget build(BuildContext context) {
    var feeCubit = context.read<FeeCubit>();
    int presentCount;
    int fees = widget.student.payableAmount!;
    int totalPayed = 0;
    int payableAmount = 0;
    String feeType;
    String paymentText;
    String dateTextOnShrink;
    Color paymentColor;
    bool showTable;

    List<List<String>> tableData = [];

    if (widget.student.feeType == 'class') {
      feeType = 'Class Based';
      presentCount = widget.student.cycleAttendancePresentCount ?? 0;
    } else {
      feeType = 'Monthly';
      presentCount = widget.student.monthAttendancePresentCount!;
    }

    if (widget.student.paymentStatus == 'paid') {
      paymentColor = AppColors.green;
      paymentText = 'Paid Completely';
      dateTextOnShrink =
          'Paid On Date: ${widget.student.paymentDueDate?.toDateString()}';
      showTable = true;
      if (widget.student.payments!.isNotEmpty) {
        for (int i = 0; i < widget.student.payments!.length; i++) {
          DateTime date = widget.student.payments![i].paymentDate!;
          int payedAmount = widget.student.payments![i].amount!;
          totalPayed = totalPayed + payedAmount;
          tableData.add([
            DateFormat('dd-MM-yyyy').format(date),
            widget.student.payments![i].collectedBy!.name.toString(),
            payedAmount.toString()
          ]);
        }
      }
      payableAmount = fees - totalPayed;
    } else if (widget.student.paymentStatus == 'partial') {
      paymentColor = AppColors.yellow;
      paymentText = 'Partially Paid';
      dateTextOnShrink =
          'Paid On Date: ${widget.student.paymentDueDate?.toDateString()}';
      showTable = true;
      if (widget.student.payments!.isNotEmpty) {
        for (int i = 0; i < widget.student.payments!.length; i++) {
          DateTime date = widget.student.payments![i].paymentDate!;
          int payedAmount = widget.student.payments![i].amount!;
          totalPayed = totalPayed + payedAmount;
          tableData.add([
            DateFormat('dd-MM-yyyy').format(date),
            widget.student.payments![i].collectedBy!.name.toString(),
            payedAmount.toString()
          ]);
        }
      }
      payableAmount = fees - totalPayed;
    } else if (widget.student.paymentStatus == 'pending' &&
        widget.student.writtenOffStatus == 1) {
      paymentColor = AppColors.green;
      paymentText = 'Written Off';
      dateTextOnShrink = 'Date Date: ${widget.student.paymentDueDate}';
      showTable = false;
    } else {
      paymentColor = AppColors.primaryColor;
      paymentText = 'Not Paid';
      dateTextOnShrink = 'Date Date: ${widget.student.paymentDueDate}';
      showTable = false;
    }

    return BlocConsumer<FeeCubit, FeeState>(
      listener: (context, state) {
        if (state is WrittenOff) {
          Alert(context).show(message: state.message);
          feeCubit.getFeeDetails(
            branchId: widget.student.branchId,
            batchId: widget.student.batchId,
            month: widget.student.month,
            year: widget.student.year,
            feeType: feeType,
            searchQuery: '',
            clean: true,
          );
        } else if (state is WriteOffFailed) {
          Alert(context).show(message: state.message);
        }
        if (state is FeeReminderSent) {
          Alert(context).show(message: state.message);
          feeCubit.getFeeDetails(
            branchId: widget.student.branchId,
            batchId: widget.student.batchId,
            month: widget.student.month,
            year: widget.student.year,
            feeType: feeType,
            searchQuery: '',
            clean: true,
          );
        } else if (state is FeeReminderSentFailed) {
          Alert(context).show(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is WritingOff) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListTile(
          title: isShrunk
              ? GestureDetector(
                  onTap: widget.onTap,
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
                                color: paymentColor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      UserImage(
                                        profilePic: widget
                                                    .student
                                                    .studentDetail!
                                                    .profilePic !=
                                                ""
                                            ? '${F.baseUrl}'
                                                '/admin/images/student/'
                                                '${widget.student.studentDetail!.id}/${widget.student.studentDetail?.profilePic}'
                                            : '',
                                      ),
                                      SizedBox(width: 16.w),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          '${widget.student.studentDetail?.name}',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        feeType,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Class Attended: $presentCount/${widget.student.monthClassesConductedCount}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${widget.student.batchName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Text(
                                        "Payment Due in:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${widget.student.branchName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        widget.student.paymentDueDate != null
                                            ? '${widget.student.paymentDueDate?.toDateString()}'
                                            : 'Not Available',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${widget.student.courseName}, ${widget.student.subjectName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "Payment Status",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '',
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        paymentText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: paymentColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Fees : $fees',
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  showTable == true
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
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
                                                            child: Text(
                                                              'Date',
                                                              style: Theme.of(
                                                                      context)
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    child: CustomPaint(
                                                      painter:
                                                          DottedBorderPainter(),
                                                      child: Center(
                                                        child: Text(
                                                          'Updated By',
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
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
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
                                                            child: Text(
                                                              'Amount',
                                                              style: Theme.of(
                                                                      context)
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
                                              rows: tableData.map((row) {
                                                return DataRow(cells: [
                                                  DataCell(
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
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
                                                                      left:
                                                                          5.0),
                                                              child: Text(
                                                                row[0],
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      child: CustomPaint(
                                                        painter:
                                                            DottedBorderPainter(),
                                                        child: Center(
                                                          child: Text(
                                                            row[1],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
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
                                                                      right:
                                                                          5.0),
                                                              child: Text(
                                                                row[2],
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
                                              width: (3 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width) /
                                                  4,
                                              child: CustomPaint(
                                                painter: DottedBorderPainter(),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                      Text(
                                                        "₹ $totalPayed",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .green),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30.h,
                                              width: (3 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width) /
                                                  4,
                                              child: CustomPaint(
                                                painter: DottedBorderPainter(),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        '₹ $payableAmount',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .primaryColor),
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
                                  FeeReminderButton(
                                    title: 'Send Reminder',
                                    onTap: paymentText == 'Paid Completely'
                                        ? () {}
                                        : () {
                                            feeCubit.sendReminder(
                                                batchFeeInvoiceId:
                                                    widget.student.id);
                                          },
                                    margin: 0,
                                    disabled:
                                        paymentText == 'Paid Completely' ||
                                                paymentText == 'Written Off'
                                            ? true
                                            : false,
                                    count: widget.student.reminderCount,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1,
                                    color: AppColors.hintColor,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (widget.student.paymentStatus != "paid")
                                    if (widget.student.writtenOffStatus != 1)
                                      Column(
                                        children: [
                                          LargeButton(
                                            title: 'Write Off',
                                            onTap: () {
                                              var formKey1 =
                                                  GlobalKey<FormState>();
                                              String? reason;
                                              CommonDialog(
                                                context: context,
                                                message:
                                                    'Are You Sure That You Want To Close\nThe Fees For ${widget.student.paymentDueDate?.toMMMMYYYY()} ?',
                                                subContent: WriteOffFeesPopUp(
                                                  formKey: formKey1,
                                                  reason: (value) {
                                                    reason = value;
                                                  },
                                                ),
                                                onTap: () {
                                                  formKey1.currentState!.save();
                                                  if (formKey1.currentState!
                                                      .validate()) {
                                                    Navigator.pop(context);
                                                    feeCubit.writeOffFees(
                                                      {
                                                        'written_off_remarks':
                                                            reason
                                                      },
                                                      batchFeeInvoiceId:
                                                          widget.student.id,
                                                    );
                                                  }
                                                },
                                              ).show();
                                            },
                                            color: AppColors.lavender,
                                            margin: 0,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                  LargeButton(
                                    title: 'Add Or Edit Fees',
                                    onTap: () {
                                      feeCubit.student = widget.student;
                                      Navigator.pushNamed(
                                          context, AddOrEditFees.route);
                                    },
                                    color: AppColors.defaultBlue,
                                    margin: 0,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  LargeButton(
                                    title: 'Other Payments',
                                    onTap: () {},
                                    color: AppColors.defaultBlue,
                                    margin: 0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShrunk = !isShrunk;
                                  });
                                },
                                child: isShrunk
                                    ? Icon(
                                        Icons.expand_less,
                                        color: AppColors.textColor,
                                      )
                                    : Icon(
                                        Icons.expand_more,
                                        color: AppColors.textColor,
                                      ),
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
                              color: paymentColor,
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
                                      profilePic: widget.student.studentDetail!
                                                  .profilePic !=
                                              ""
                                          ? '${F.baseUrl}'
                                              '/admin/images/student/'
                                              '${widget.student.studentDetail!.id}/${widget.student.studentDetail?.profilePic}'
                                          : '',
                                    ),
                                    SizedBox(width: 16.w),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        '${widget.student.studentDetail?.name}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FeeReminderButton(
                                      title: '',
                                      onTap: () {},
                                      margin: 0,
                                      disabled:
                                          paymentText == 'Paid Completely' ||
                                                  paymentText == 'Written Off'
                                              ? true
                                              : false,
                                      count: widget.student.reminderCount,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dateTextOnShrink,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColors.textColor,
                                      ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  paymentText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: paymentColor,
                                      ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShrunk = !isShrunk;
                                });
                              },
                              child: isShrunk
                                  ? Icon(
                                      Icons.expand_less,
                                      color: AppColors.textColor,
                                    )
                                  : Icon(
                                      Icons.expand_more,
                                      color: AppColors.textColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
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
