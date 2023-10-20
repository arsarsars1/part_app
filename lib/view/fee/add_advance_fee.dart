import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/button.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/common_field.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/student_batch_picker.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';
import 'package:part_app/view_model/student/student_cubit.dart';

class AddAdvanceFeePage extends StatefulWidget {
  static const route = '/add-advance-fee';
  const AddAdvanceFeePage({Key? key}) : super(key: key);

  @override
  State<AddAdvanceFeePage> createState() => _AddAdvanceFeePageState();
}

class _AddAdvanceFeePageState extends State<AddAdvanceFeePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  var formKey = GlobalKey<FormState>();
  String? amount;
  BatchModel? batch;
  FeeCubit? feeCubit;
  @override
  void initState() {
    feeCubit = context.read<FeeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Add Advance Fee',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) {
          if (state is AddedFees) {
            date = null;
            dateController.text = "";
            amount = null;
            setState(() {});
            Alert(context).show(message: state.message);
          } else if (state is AddFeesFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AddingFees) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 15.h),
                CommonField(
                  controller: batchController,
                  onTap: () async {
                    scaffoldKey.currentState?.showBottomSheet(
                      elevation: 10,
                      backgroundColor: Colors.transparent,
                      (context) => StudentBatchPicker(
                        studentId: context
                                .read<StudentCubit>()
                                .student
                                ?.studentDetail?[0]
                                .id ??
                            0,
                        status: '',
                        onSelect: (value) {
                          batch = value;
                          batchController.text = value.name;
                          setState(() {});
                        },
                      ),
                    );
                  },
                  disabled: true,
                  title: 'Batch *',
                  hint: 'Select Batch',
                  onChange: (value) {},
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 32),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: Colors.white24,
                    ),
                  ),
                  validator: (value) {
                    return value == null ? 'Please select batch.' : null;
                  },
                ),
                if (batch != null)
                  Column(
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
                                  "${context.read<StudentCubit>().student?.studentDetail?[0].name}",
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      batch?.pivot?.feeType == "monthly"
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
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "${batch?.name}",
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
                                        "${batch?.branchName}",
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
                                      "${batch?.courseName}, ${batch?.subjectName}",
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
                            Text(
                              "Fees: ₹${batch?.fee}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                                  feeCubit?.addAdvanceFees({
                                    'student_detail_id': context
                                        .read<StudentCubit>()
                                        .student
                                        ?.studentDetail?[0]
                                        .id,
                                    'amount': amount,
                                    'payment_method': 'cash',
                                    'payment_date': date?.toServerString(),
                                    'batch_id': batch?.id
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
              ],
            ),
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
