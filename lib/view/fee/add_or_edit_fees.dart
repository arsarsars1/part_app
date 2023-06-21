import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';

class AddOrEditFees extends StatefulWidget {
  static const route = '/fees/add-fees';
  const AddOrEditFees({super.key});

  @override
  State<AddOrEditFees> createState() => _AddOrEditFeesState();
}

class _AddOrEditFeesState extends State<AddOrEditFees> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Edit Fee Details',
      ),
      body: ListView(
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
                      "Student Name",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Class Based",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.green,
                                    fontSize: 11.sp,
                                  ),
                        ),
                        Text(
                          "Class Attended: 12 / 12",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                          "Batch Name",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                        ),
                        Text(
                          "Branch Name",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                        ),
                        Text(
                          "Course, Subject",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 11.sp,
                                  ),
                        ),
                      ],
                    ),
                    RichText(
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
                            text: '0 Classes',
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
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                      Text(
                        "Overdue",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                  "Fees: ₹1200.00",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
              ],
            ),
          ),
          Container(
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
                Table(
                  border: TableBorder.all(
                    color: AppColors.grey86,
                    width: 0.5,
                  ),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
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
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 30.h,
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
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(right: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerRight,
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
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '07-08-2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.grey.shade700,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'Admin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.grey.shade700,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(right: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '₹100.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.grey.shade700,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '09-08-2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'Admin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(right: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '₹200.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Table(
                  border: TableBorder.all(
                    color: AppColors.grey86,
                    width: 0.5,
                  ),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Clerical Error',
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
                  ],
                )
              ],
            ),
          ),
          Container(
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
                Table(
                  border: TableBorder.all(
                    color: AppColors.grey86,
                    width: 0.5,
                  ),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
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
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 30.h,
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
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(right: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerRight,
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
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '09-08-2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'Admin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.only(right: 10.h),
                            height: 30.h,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '₹200.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                      TextSpan(
                        text: '₹200.00',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
            onChange: (value) {},
          ),
          SizedBox(
            height: 15.h,
          ),
          CommonField(
            inputType: const TextInputType.numberWithOptions(),
            length: 50,
            title: 'Date *',
            hint: 'Enter Fees',
            validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return 'Please enter fees';
              }
              return null;
            },
            onChange: (value) {},
          ),
          Center(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Button(
                  onTap: () {},
                  title: 'Submit',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
