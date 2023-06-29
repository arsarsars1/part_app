import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/edit_student_batches.dart';
import 'package:part_app/view/students/student_details.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignStudentBatch extends StatefulWidget {
  static const route = '/students/add/assign-batch';

  final bool editStudent;

  const AssignStudentBatch({Key? key, required this.editStudent})
      : super(key: key);

  @override
  State<AssignStudentBatch> createState() => _AssignStudentBatchState();
}

class _AssignStudentBatchState extends State<AssignStudentBatch> {
  TextEditingController joiningDateController = TextEditingController();

  String? fee;
  String? admissionFee;
  String? joiningDate;

  String? payDay;

  bool admissionFeePaid = false;
  bool feePaid = false;

  String selected = 'monthly';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var studentCubit = context.read<StudentCubit>();
    String student = 'Not Available';
    if (widget.editStudent) {
      student = studentCubit.student?.studentDetail?[0].name ?? 'Not Available';
    } else {
      student = studentCubit.studentRequest.name ?? 'Not Available';
    }
    return Scaffold(
      appBar: const CommonBar(
        title: 'Assign Student To Batch',
      ),
      body: BlocListener<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is CreatingStudent) {
            Loader(
              context,
              message:
                  widget.editStudent ? 'Adding to batch' : 'Creating student..',
            ).show();
          } else if (state is CreatedStudent) {
            Alert(context).show(
              message:
                  widget.editStudent ? 'Added to batch' : 'Created student',
            );

            if (widget.editStudent) {
              context.read<BatchCubit>().refresh();

              context.read<StudentCubit>().getStudentBatches();
              context.read<StudentCubit>().second = true;
              Navigator.pushNamed(
                context,
                EditStudentBatches.route,
                arguments: widget.editStudent,
              );
            } else {
              // Navigator.popUntil(
              //   context,
              //   ModalRoute.withName(StudentsView.route),
              // );
              var cubit = context.read<StudentCubit>();
              cubit.studentDetails(cubit.tempStudent?.studentDetail?[0].id);
              Navigator.pop(context);
              Navigator.pop(
                context,
                StudentDetails.route,
              );
              context.read<StudentCubit>().getStudentBatches();
              Navigator.pushNamed(context, EditStudentBatches.route,
                  arguments: widget.editStudent);
            }
          } else if (state is CreateStudentFailed) {
            Alert(context).show(message: state.message);
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<BatchCubit, BatchState>(
          buildWhen: (prv, crr) =>
              crr is FetchingBatch ||
              crr is FetchedBatch ||
              crr is FetchBatchFailed,
          builder: (context, state) {
            BatchModel? batch = context.read<BatchCubit>().batchModel;
            var cubit = context.read<StudentCubit>();

            if (state is FetchingBatch) {
              return const LoadingView(
                hideColor: true,
              );
            } else if (state is FetchedBatch) {
              return Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        student,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Center(
                      child: Text(
                        batch?.name ?? 'NA',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Center(
                      child: Text(
                        batch?.branchName ?? 'NA',
                      ),
                    ),
                    Center(
                      child:
                          Text('${batch?.courseName}, ${batch?.subjectName}'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            batch?.days[index] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(),
                          ),
                        );
                      },
                      itemCount: batch?.days.length ?? 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      initialValue: '${batch?.admissionFee}',
                      inputType: const TextInputType.numberWithOptions(),
                      title: 'Admission Fee*',
                      hint: 'Enter Admission Fee',
                      onChange: (value) {
                        admissionFee = value;
                      },
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter admission fee.';
                        }
                        return null;
                      },
                    ),
                    TextSwitchButton(
                      onChange: (value) {
                        setState(() {
                          admissionFeePaid = value;
                        });
                      },
                      title: 'Admission Fee is Paid',
                      selected: admissionFeePaid,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonField(
                      initialValue: '${batch?.fee}',
                      inputType: const TextInputType.numberWithOptions(),
                      length: 50,
                      title: 'Fee *',
                      hint: 'Enter Fee',
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter fee';
                        }
                        return null;
                      },
                      onChange: (value) {
                        fee = value;
                      },
                    ),
                    TextSwitchButton(
                      onChange: (value) {
                        setState(() {
                          feePaid = value;
                        });
                      },
                      title: 'Fee Is Paid For The Month',
                      selected: feePaid,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      controller: joiningDateController,
                      onTap: datePicker,
                      disabled: true,
                      hint: 'dd/mm/yyyy',
                      title: 'Joining Date *',
                      validator: (value) {
                        return value == null || value.toString().isEmpty
                            ? 'Please enter joining date.'
                            : null;
                      },
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'Select Fee Type *',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'monthly';
                            });
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: AppColors.green,
                                value: 'monthly',
                                groupValue: selected,
                                onChanged: (value) {
                                  setState(() {
                                    selected = value!;
                                  });
                                },
                              ),
                              const Text('Monthly'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'class';
                            });
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: AppColors.green,
                                value: 'class',
                                groupValue: selected,
                                onChanged: (value) {
                                  setState(() {
                                    selected = value!;
                                  });
                                },
                              ),
                              const Text('Class Based'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CommonField(
                      inputType: const TextInputType.numberWithOptions(),
                      length: selected == 'class' ? 3 : 2,
                      title: selected == 'class'
                          ? 'Total Classes *'
                          : 'Monthly Pay Day *',
                      hint: 'Enter ${selected != 'class' ? 'pay day' : 'days'}',
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter ${selected != 'class' ? 'pay day' : 'days'}';
                        }
                        return null;
                      },
                      onChange: (value) {
                        payDay = value;
                        if (value.toString().length == 2) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          height: 32.h,
                          width: 100.w,
                          onTap: () => Navigator.pop(context),
                          title: 'Cancel',
                          border: true,
                        ),
                        Button(
                          height: 32.h,
                          width: 100.w,
                          onTap: () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              if (widget.editStudent) {
                                cubit.setStudent(StudentRequest(
                                  feeAmount: fee,
                                  countryCode: 91,
                                  batchId: batch?.id,
                                  admissionFees: admissionFee,
                                  doj: joiningDate,
                                  feeType: selected,
                                  noOfClasses: selected == 'class'
                                      ? int.tryParse(payDay!)
                                      : null,
                                  paymentDueDate: selected != 'class'
                                      ? int.tryParse(payDay!)
                                      : null,
                                  isAdmissionFeesPaid: admissionFeePaid ? 1 : 0,
                                  isCourseFeesPaid: feePaid ? 1 : 0,
                                ));

                                cubit.enrollToBatch();
                              } else {
                                cubit.setStudent(cubit.studentRequest.copyWith(
                                  feeAmount: fee,
                                  countryCode: 91,
                                  batchId: batch?.id,
                                  admissionFees: admissionFee,
                                  doj: joiningDate,
                                  feeType: selected,
                                  noOfClasses: selected == 'class'
                                      ? int.tryParse(payDay!)
                                      : null,
                                  paymentDueDate: selected != 'class'
                                      ? int.tryParse(payDay!)
                                      : null,
                                  isAdmissionFeesPaid: admissionFeePaid ? 1 : 0,
                                  isCourseFeesPaid: feePaid ? 1 : 0,
                                ));
                                cubit.createStudent();
                              }
                            }
                          },
                          title: 'Ok',
                        ),
                      ],
                    )
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  // method to get the date for [ joining date ]
  void datePicker() {
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
      firstDate: DateTime(
        DateTime.now().year - 50,
      ),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        joiningDate = value.toServerString();
        joiningDateController.text = value.toDateString();
      }
    });
  }
}
