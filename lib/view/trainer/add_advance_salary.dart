import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/button.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/common_field.dart';
import 'package:part_app/view_model/trainer/trainer_cubit.dart';

class AddAdvanceSalaryPage extends StatefulWidget {
  static const route = '/add-advance-salary';
  const AddAdvanceSalaryPage({Key? key}) : super(key: key);

  @override
  State<AddAdvanceSalaryPage> createState() => _AddAdvanceSalaryPageState();
}

class _AddAdvanceSalaryPageState extends State<AddAdvanceSalaryPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  var formKey = GlobalKey<FormState>();
  String? amount;
  BatchModel? batch;
  TrainerCubit? trainerCubit;
  @override
  void initState() {
    trainerCubit = context.read<TrainerCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Add Advance Salary',
      ),
      body: BlocConsumer<TrainerCubit, TrainerState>(
        listener: (context, state) {
          if (state is AddedSalary) {
            date = null;
            dateController.text = "";
            amount = null;
            setState(() {});
            Alert(context).show(message: state.message);
          } else if (state is AddSalaryFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AddingSalary) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 15.h),
                Column(
                  children: [
                    CommonField(
                      inputType: const TextInputType.numberWithOptions(),
                      length: 50,
                      title: 'Salary *',
                      hint: 'Enter Salary',
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter salary';
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
                                trainerCubit?.addAdvanceFees({
                                  'trainer_detail_id': context
                                      .read<TrainerCubit>()
                                      .trainer
                                      ?.trainerDetail?[0]
                                      .id,
                                  'amount': amount,
                                  'payment_method': 'cash',
                                  'payment_date': date?.toServerString(),
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
