import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/class_link/class_link_list.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class ClassLinkView extends StatefulWidget {
  static const route = '/class-link';
  final bool isEdit;

  const ClassLinkView({Key? key, this.isEdit = false}) : super(key: key);

  @override
  State<ClassLinkView> createState() => _ClassLinkViewState();
}

class _ClassLinkViewState extends State<ClassLinkView> {
  int? branchId;
  BatchModel? batch;
  DateTime? date;
  String? classLink;
  List<String>? batchDays = [];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(title: 'Online Class'),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is AddingLink) {
            Loader(context).show();
          } else if (state is AddedLink) {
            Navigator.pop(context);
            Alert(context).show(message: 'Class link added');
            formKey.currentState?.reset();
            batchController.clear();
            dateController.clear();
            date = null;
            setState(() {});
          } else if (state is AddLinkFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              if (!widget.isEdit)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 16.h,
                    ),
                    child: Button(
                      height: 30.h,
                      onTap: () {
                        Navigator.pushNamed(context, ClassLinkList.route);
                      },
                      title: 'List Online Classes',
                    ),
                  ),
                ),
              if (!widget.isEdit)
                const SizedBox(
                  height: 20,
                ),
              CommonField(
                title: 'Online Class Link *',
                hint: 'Enter the class link',
                onChange: (value) {
                  classLink = value;
                },
                validator: (value) {
                  bool validUrl = Uri.parse(value).isAbsolute;

                  return !validUrl ? 'Please enter a valid class link.' : null;
                },
                onSubmit: (value) {
                  classLink = value;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BranchField(
                onSelect: (value) {
                  setState(() {
                    branchId = value;
                  });
                  batchCubit.getBatchesByStatus(
                    branchId: branchId,
                    clean: true,
                    branchSearch: true,
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonField(
                controller: batchController,
                onTap: () {
                  batchDays?.clear();
                  if (branchId != null) {
                    scaffoldKey.currentState?.showBottomSheet(
                      backgroundColor: Colors.transparent,
                      (context) => BatchPicker(
                        branchId: branchId!,
                        status: '',
                        branchSearch: true,
                        onSelect: (value) {
                          batch = value;
                          batchController.text = value.name;
                          for (var element in batch!.days) {
                            batchDays?.add(element.split(" ")[0]);
                          }
                        },
                      ),
                    );
                  } else {
                    Alert(context).show(
                      message: 'Please select the Branch.',
                    );
                  }
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
                  return value.isEmpty ? 'Please select batch.' : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                controller: dateController,
                title: 'Date *',
                hint: 'Select the date',
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 32),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: Colors.white24,
                  ),
                ),
                disabled: true,
                onTap: () {
                  datePicker();
                },
                onChange: (value) {},
                validator: (value) {
                  return value.isEmpty ? 'Please select the date.' : null;
                },
                onSubmit: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Time: '),
                    Text(
                      date == null ? '-' : getBatchTime(date!),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Button(
                  height: 30.h,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      batchCubit.addClassLink(batch?.id, {
                        'class_date': date?.toServerYMD(),
                        'link': classLink,
                        'service': Uri.parse(classLink!).host,
                        'start_time': batch?.batchDetail?[0].startTime,
                        'end_time': batch?.batchDetail?[0].endTime
                      });
                    }
                  },
                  title: widget.isEdit ? 'Update Class Link' : 'Add Class Link',
                ),
              ),
              if (!widget.isEdit)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Today\'s Online Classes'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String getBatchTime(DateTime date) {
    String day = date.toDay().substring(0, 3);

    String? str = batch?.days
        .firstWhere((element) => element.contains(day), orElse: () => '');
    return str ?? '-';
  }

  // method to get the date for [ class ]
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
      firstDate: DateTime(1900),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
    ).then((value) {
      if (value != null) {
        if (!batchDays!.contains(value.formattedDay2())) {
          Alert(context).show(
            message: 'Selected batch does not have class on selected date',
          );
          return;
        }
        date = value;
        dateController.text = value.toDateString();
        setState(() {});
      }
    });
  }
}
