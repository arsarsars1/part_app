import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/class_picker.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class EditClassLink extends StatefulWidget {
  static const route = '/edit-class-link';

  const EditClassLink({Key? key}) : super(key: key);

  @override
  State<EditClassLink> createState() => _EditClassLinkState();
}

class _EditClassLinkState extends State<EditClassLink> {
  int? branchId;
  BatchModel? batch;
  DateTime? date;
  String? classLink;
  List<String>? batchDays = [];
  ClassModel? selectedclass;
  bool branchChange = false,
      batchChange = false,
      dateChange = false,
      classChange = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: CommonBar(
        title: 'Edit Online Class',
        onPressed: () {
          batchCubit.classLinks;
          Navigator.pop(context);
        },
      ),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is UpdatingLink) {
            Loader(context).show();
          } else if (state is UpdatedLink) {
            Navigator.pop(context);
            Navigator.pop(context);
            batchCubit.getClassLink(batchCubit.tempClass?.batchId,
                batchCubit.tempClass?.classDate ?? DateTime.now());
            Alert(context).show(message: 'Class link updated');
            formKey.currentState?.reset();
            dateController.clear();
            date = null;
            setState(() {});
          } else if (state is UpdateLinkFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Online Class Link *',
                hint: 'Enter the class link',
                initialValue: batchCubit.tempClass?.link,
                onChange: (value) {
                  classLink = value;
                },
                capitalization: TextCapitalization.none,
                validator: (value) {
                  bool validUrl;
                  if (value.contains("https://")) {
                    validUrl = Uri.parse(value).isAbsolute;
                  } else {
                    value = "https://$value";
                    validUrl = Uri.parse(value).isAbsolute;
                  }

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
                initialBranch: (context
                        .read<BranchCubit>()
                        .branches
                        .where((element) =>
                            element.branchName ==
                            batchCubit.tempClass?.branchName)
                        .toList())[0]
                    .id,
                onSelect: (value) {
                  setState(() {
                    branchId = value;
                    branchChange = true;
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
              batchCubit.tempClass?.batchName != null &&
                      batch == null &&
                      branchChange == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            'Batch*',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.liteDark,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${batchCubit.tempClass?.batchName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  batchDays?.clear();

                                  scaffoldKey.currentState?.showBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    (context) => BatchPicker(
                                      branchId:
                                          batchCubit.tempClass?.batchId ?? 0,
                                      status: '',
                                      branchSearch: true,
                                      onSelect: (value) {
                                        batch = value;
                                        batchController.text = value.name;
                                        batchChange = true;
                                        for (var element in batch!.days) {
                                          batchDays?.add(element.split(" ")[0]);
                                        }
                                        // batchCubit.getClassLink(batch?.id, DateTime.now());
                                        batchCubit.getClassLink(
                                            batch?.id,
                                            batchCubit.tempClass?.classDate ??
                                                DateTime.now());
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: Colors.white24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : CommonField(
                      controller: batchController,
                      onTap: () {
                        batchDays?.clear();

                        scaffoldKey.currentState?.showBottomSheet(
                          backgroundColor: Colors.transparent,
                          (context) => BatchPicker(
                            branchId: branchId!,
                            status: '',
                            branchSearch: true,
                            onSelect: (value) {
                              batch = value;
                              batchController.text = value.name;
                              batchChange = true;
                              for (var element in batch!.days) {
                                batchDays?.add(element.split(" ")[0]);
                              }
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
                        return value.isEmpty ? 'Please select batch.' : null;
                      },
                    ),
              const SizedBox(
                height: 20,
              ),
              batchCubit.tempClass?.classDate != null &&
                      branchChange == false &&
                      batchChange == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            'Date*',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.liteDark,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${date?.toDateString() ?? batchCubit.tempClass?.classDate?.toDateString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  datePicker().then((value) {
                                    date = DateTime.parse(value ?? "");
                                    dateController.text =
                                        date?.toDateString() ?? "";
                                    setState(() {
                                      selectedclass = null;
                                      dateChange = true;
                                    });
                                    scaffoldKey.currentState?.showBottomSheet(
                                      enableDrag: false,
                                      elevation: 10,
                                      backgroundColor: Colors.transparent,
                                      (context) => ClassPicker(
                                        branchId: batch?.branchId,
                                        batchId: batch?.id ??
                                            batchCubit.tempClass?.batchId,
                                        date: date?.toServerYMD() ??
                                            batchCubit.tempClass?.classDate
                                                ?.toServerYMD(),
                                        scaffoldKey: scaffoldKey,
                                        onSave: (ClassModel value) {
                                          setState(() {
                                            // dateController.text =
                                            //     date?.toDDMMYYY() ?? "";
                                            selectedclass = value;
                                          });
                                        },
                                      ),
                                    );
                                  });
                                },
                                child: const Icon(
                                  Icons.calendar_month,
                                  size: 24,
                                  color: Colors.white24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : ScheduleField(
                      title: 'Date *',
                      hint: 'Select the date',
                      // padding: 16,
                      // margin: 25,
                      onSelect: (String value) {
                        date = DateTime.parse(value);
                        dateController.text = date?.toDateString() ?? "";
                        setState(() {
                          selectedclass = null;
                          dateChange = true;
                        });
                        scaffoldKey.currentState?.showBottomSheet(
                          enableDrag: false,
                          elevation: 10,
                          backgroundColor: Colors.transparent,
                          (context) => ClassPicker(
                            branchId: batch?.branchId,
                            batchId: batch?.id ?? batchCubit.tempClass?.batchId,
                            date:
                                batchCubit.tempClass?.classDate?.toServerYMD(),
                            scaffoldKey: scaffoldKey,
                            onSave: (ClassModel value) {
                              setState(() {
                                dateController.text = date?.toDDMMYYY() ?? "";
                                selectedclass = value;
                              });
                            },
                          ),
                        );
                      },
                      time: false,
                    ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text('Selected Class'),
                ),
              ),
              branchChange == false &&
                      batchChange == false &&
                      dateChange == false &&
                      selectedclass == null
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            batchCubit.tempClass?.classDate == null
                                ? 'No class selected'
                                : '${batchCubit.tempClass?.classDate?.formattedDay2()} ${batchCubit.tempClass?.startTime?.toAmPM()} - ${batchCubit.tempClass?.endTime?.toAmPM()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(),
                          ),
                          if (batchCubit.tempClass?.classDate != null)
                            GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState?.showBottomSheet(
                                  enableDrag: false,
                                  elevation: 10,
                                  backgroundColor: Colors.transparent,
                                  (context) => ClassPicker(
                                    branchId: batch?.branchId,
                                    batchId: batch?.id ??
                                        batchCubit.tempClass?.batchId,
                                    date: batchCubit.tempClass?.classDate
                                        ?.toServerYMD(),
                                    scaffoldKey: scaffoldKey,
                                    onSave: (ClassModel value) {
                                      setState(() {
                                        selectedclass = value;
                                      });
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 24,
                                color: Colors.white24,
                              ),
                            )
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            date == null || selectedclass == null
                                ? 'No class selected'
                                : "${date?.formattedDay2()} ${selectedclass?.startTime.toAmPM()} - ${selectedclass?.endTime.toAmPM()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(),
                          ),
                          if (date != null && selectedclass != null)
                            GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState?.showBottomSheet(
                                  enableDrag: false,
                                  elevation: 10,
                                  backgroundColor: Colors.transparent,
                                  (context) => ClassPicker(
                                    branchId: batch?.branchId,
                                    batchId: batch?.id ??
                                        batchCubit.tempClass?.batchId,
                                    date: date?.toServerYMD(),
                                    scaffoldKey: scaffoldKey,
                                    onSave: (ClassModel value) {
                                      setState(() {
                                        selectedclass = value;
                                      });
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 24,
                                color: Colors.white24,
                              ),
                            )
                        ],
                      ),
                    ),
              Center(
                child: Button(
                  height: 50.h,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      batchCubit.updateClassLink(
                          batch?.id ?? batchCubit.tempClass?.batchId,
                          batchCubit.tempClass?.id, {
                        'class_date': date?.toServerYMD() ??
                            batchCubit.tempClass?.classDate?.toServerYMD(),
                        'link': (classLink ?? batchCubit.tempClass?.link)
                                    ?.contains("https://") ??
                                false
                            ? classLink ?? batchCubit.tempClass?.link
                            : "https://${classLink ?? batchCubit.tempClass?.link}",
                        'service': Uri.parse((classLink ??
                                            batchCubit.tempClass?.link)
                                        ?.contains("https://") ??
                                    false
                                ? classLink ?? batchCubit.tempClass?.link ?? ""
                                : "https://${classLink ?? batchCubit.tempClass?.link ?? ""}")
                            .host,
                        'start_time': batch?.batchDetail?[0].startTime ??
                            batchCubit.tempClass?.startTime,
                        'end_time': batch?.batchDetail?[0].endTime ??
                            batchCubit.tempClass?.endTime
                      });
                    }
                  },
                  title: 'Update Class Link',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // method to get the date for [ dob ]
  Future<String?> datePicker() async {
    DateTime? dateTime = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
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
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 100,
      ),
    );

    if (dateTime != null) {
      return dateTime.toServerYMD();
    }
    return null;
    // return widget.dateMonth ? dateTime?.toMMMMYYYY() : dateTime?.toDateString();
  }
}
