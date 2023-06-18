import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/fee_reminder_button.dart';
import 'package:part_app/view/components/large_button.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';
import '../../../flavors.dart';
import '../../../model/data_model/fee_response.dart';

class FeeListItem extends StatelessWidget {
  final Datum student;
  final VoidCallback onTap;

  const FeeListItem({Key? key, required this.student, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int presentCount;
    String feeType;
    String paymentText;
    Color paymentColor;
    bool showTable;

    List<List<String>> tableData = [
    ];

    if (student.feeType == 'class') {
      feeType = 'Class Based';
      presentCount = student.classAttendancePresentCount!;
    } else {
      feeType = 'Monthly';
      presentCount = student.monthAttendancePresentCount!;
    }

    if (student.paymentStatus == 'paid') {
      paymentColor = AppColors.green;
      paymentText = 'Paid Completely';
      showTable = true;


      tableData.add([student.payments![0].toString(), 'Row', '0']);


    } else if (student.paymentStatus == 'partial') {
      paymentColor = AppColors.yellow;
      paymentText = 'Partially Paid';
      showTable = true;
    } else {
      paymentColor = AppColors.primaryColor;
      paymentText = 'Not Paid';
      showTable = false;
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 20,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: paymentColor,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            UserImage(
                              profilePic: student.studentDetail!.profilePic !=
                                      ""
                                  ? '${F.baseUrl}'
                                      '/admin/images/student/'
                                      '${student.studentDetail!.id}/${student.studentDetail?.profilePic}'
                                  : '',
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                '${student.studentDetail!.name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  feeType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "Class Attended: $presentCount/${student.monthClassesConductedCount}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${student.batchName}',
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Payment Due in:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${student.branchName}',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            student.paymentDueDate != null
                                ? '${student.paymentDueDate}'
                                : 'Not Available',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${student.courseName}, ${student.subjectName}',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Payment Status",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            paymentText,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: paymentColor,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fees : ${student.payableAmount}',
                        textAlign: TextAlign.right,
                        style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),



                      showTable == true
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Center(
                                child: Column(
                                  children: [







                                    DataTable(
                                      headingRowHeight: 25,
                                      dataRowMinHeight: 25,
                                      dataRowMaxHeight: 25,
                                      columnSpacing: 0.0,
                                      columns: [
                                        DataColumn(
                                          label: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                3,
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
                                                          .bodyText1
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
                                                      .bodyText1
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                3,
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
                                                          .bodyText1
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
                                                  3,
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
                                                  3,
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
                                                  3,
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
                                                        row[2],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ]);
                                      }).toList(),
                                    ),









                                    CustomPaint(
                                      painter: DottedBorderPainter(),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Total Amount Paid : ',
                                            ),
                                            Text(
                                              "400.00",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      color: AppColors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomPaint(
                                      painter: DottedBorderPainter(),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Amount Payable : ',
                                            ),
                                            Text(
                                              "800.00",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            )





                          : const SizedBox(
                              height: 0,
                            ),
                      FeeReminderButton(
                        title: 'Send Reminder',
                        onTap: () {},
                        margin: 0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: AppColors.hintColor,
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LargeButton(
                        title: 'Write Off',
                        onTap: () {},
                        color: AppColors.lavender,
                        margin: 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LargeButton(
                        title: 'Add Or Edit Fees',
                        onTap: () {},
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
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 34,
                      color: Colors.white,
                    ),
                  )
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
