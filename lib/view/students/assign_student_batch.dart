import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/components/text_swtich_button.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class AssignStudentBatch extends StatefulWidget {
  static const route = '/students/add/assign-batch';

  const AssignStudentBatch({Key? key}) : super(key: key);

  @override
  State<AssignStudentBatch> createState() => _AssignStudentBatchState();
}

class _AssignStudentBatchState extends State<AssignStudentBatch> {
  TextEditingController joiningDateController = TextEditingController();

  String? fee;
  String? admissionFee;
  String? joiningDate;

  bool admissionFeePaid = false;
  bool feePaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Assign Student To Batch',
      ),
      body: BlocBuilder<BatchCubit, BatchState>(
        buildWhen: (prv, crr) =>
            crr is FetchingBatch ||
            crr is FetchedBatch ||
            crr is FetchBatchFailed,
        builder: (context, state) {
          BatchModel? batch = context.read<BatchCubit>().batchModel;
          var cubit = context.read<StudentCubit>();

          if (state is FetchingBatch) {
            return const LoadingView();
          } else if (state is FetchedBatch) {
            return ListView(
              children: [
                Center(
                  child: Text(
                    cubit.studentRequest.name ?? 'Not Available',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    batch?.name ?? 'NA',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                  child: Text('${batch?.courseName}, ${batch?.subjectName}'),
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
                        style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(),
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
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

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
      initialDate: DateTime(
        DateTime.now().year - 18,
      ),
      firstDate: DateTime(
        DateTime.now().year - 100,
      ),
      lastDate: DateTime(
        DateTime.now().year - 18,
      ),
    ).then((value) {
      if (value != null) {
        joiningDate = value.toServerString();
        joiningDateController.text = value.toDateString();
      }
    });
  }
}
