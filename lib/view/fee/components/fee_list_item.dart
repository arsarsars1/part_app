import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/view/components/fee_reminder_button.dart';
import 'package:part_app/view/components/large_button.dart';
import 'package:part_app/view/components/launcher.dart';
import 'package:part_app/view/components/user_image.dart';
import 'package:part_app/view/constants/constant.dart';

class FeeListItem extends StatelessWidget {
  final StudentModel student;
  final VoidCallback onTap;

  const FeeListItem({Key? key, required this.student, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
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
                        profilePic: student.profilePic != ""
                            ? '${F.baseUrl}'
                                '/admin/images/student/'
                                '${student.detailId}/${student.profilePic}'
                            : '',
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          '${student.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monthly',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Class Attended: 12/12",
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
                    const Text(
                      'Batch Name',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Payment Due in:",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Branch Name',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "20 May 2023",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Course, Subject',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payment Status",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
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
                      "Partially Paid",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.yellow,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Fees : 1200.00",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Center(
                                  child: Text(
                                    'Updated By',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      'Amount',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      '05-06-2023',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Center(
                                  child: Text('Admin'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                      child: Text('200.00')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      '01-06-2023',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Center(
                                  child: Text('Trainer'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomPaint(
                                painter: DottedBorderPainter(),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                      child: Text('200.00')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomPaint(
                          painter: DottedBorderPainter(),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Total Amount Paid : ',
                                ),
                                Text(
                                  "400.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomPaint(
                          painter: DottedBorderPainter(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Amount Payable : ',
                                ),
                                Text(
                                  "800.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ),

                          // child: Center(
                          //   child: Text('Amount Payable : '),
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
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
                  title: 'Add Or Edit Fes',
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
