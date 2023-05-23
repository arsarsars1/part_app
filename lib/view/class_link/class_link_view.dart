import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/class_picker.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/class_link/class_link_list.dart';
import 'package:part_app/view/class_link/edit_class_link.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class ClassLinkView extends StatefulWidget {
  static const route = '/class-link';
  const ClassLinkView({Key? key}) : super(key: key);

  @override
  State<ClassLinkView> createState() => _ClassLinkViewState();
}

class _ClassLinkViewState extends State<ClassLinkView> {
  int? branchId;
  BatchModel? batch;
  DateTime? date;
  String? classLink;
  List<String>? batchDays = [];
  ClassModel? selectedclass;

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
        title: 'Online Class',
        onPressed: () {
          batchCubit.classLinks;
          Navigator.pop(context);
        },
      ),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is AddingLink) {
            Loader(context).show();
          } else if (state is AddedLink) {
            Navigator.pop(context);
            batchCubit.getClassLink(batch?.id, DateTime.now());
            Alert(context).show(message: 'Class link added');
            formKey.currentState?.reset();
            batchController.clear();
            dateController.clear();
            date = null;
            setState(() {});
          } else if (state is AddLinkFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          } else if (state is FetchingLinks || state is RemovingLink) {
            Loader(context).show();
          } else if (state is RemovedLink) {
            Navigator.pop(context);
            Alert(context).show(message: 'Online Class Deleted');
            batchCubit.getClassLink(batch?.id, DateTime.now());
          } else if (state is RemoveLinkFailed) {
            Alert(context).show(message: state.message);
          } else if (state is FetchedLinks) {
            Navigator.pop(context);
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
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
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Online Class Link *',
                hint: 'Enter the class link',
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
                onSelect: (value) {
                  if (branchId != null) {
                    AlertBox.showConfirmation(
                      message:
                          'Are your sure, that you need to change the branch',
                      subMessage:
                          'Note: Please be aware that when you change the branch, the underlying batch, date and selected class will be also cleared',
                      buttonText: 'OK',
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          batch = null;
                          batchController.text = "";
                          dateController.text = "";
                          selectedclass = null;
                        });
                      },
                      hasClose: true,
                      context,
                    );
                  }
                  setState(() {
                    branchId = value;
                  });
                  batchCubit.getBatchesByStatus(
                    branchId: branchId,
                    clean: true,
                    branchSearch: true,
                  );
                  // setState(() {
                  //   branchId = value;
                  // });
                  // batchCubit.getBatchesByStatus(
                  //   branchId: branchId,
                  //   clean: true,
                  //   branchSearch: true,
                  // );
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
                          // batchCubit.getClassLink(batch?.id, DateTime.now());
                          batchCubit.getClassLink(batch?.id, DateTime.now());
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
              ScheduleField(
                title: 'Date *',
                hint: 'Select the date',
                onSelect: (String value) {
                  if (branchId == null || batch?.id == null) {
                    Alert(context).show(message: 'Branch or Batch is missing');
                    return;
                  }
                  date = DateTime.parse(value);
                  setState(() {
                    selectedclass = null;
                  });
                  scaffoldKey.currentState?.showBottomSheet(
                    enableDrag: false,
                    elevation: 10,
                    backgroundColor: Colors.transparent,
                    (context) => ClassPicker(
                      branchId: batch?.branchId,
                      batchId: batch?.id,
                      date: date?.toServerYMD(),
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
                  padding: EdgeInsets.all(16.0),
                  child: Text('Selected Class'),
                ),
              ),
              Container(
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
                      selectedclass == null
                          ? 'No class selected'
                          : "${date?.formattedDay2()} ${selectedclass?.startTime.toAmPM()} - ${selectedclass?.endTime.toAmPM()}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                    ),
                    if (selectedclass != null)
                      GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.showBottomSheet(
                            enableDrag: false,
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => ClassPicker(
                              branchId: batch?.branchId,
                              batchId: batch?.id,
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Button(
                  height: 50.h,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      batchCubit.addClassLink(batch?.id, {
                        'class_date': date?.toServerYMD(),
                        'link': classLink?.contains("https://") ?? false
                            ? classLink
                            : "https://$classLink",
                        'service': Uri.parse(
                                classLink?.contains("https://") ?? false
                                    ? classLink ?? ""
                                    : "https://${classLink ?? ""}")
                            .host,
                        'start_time': selectedclass?.startTime,
                        'end_time': selectedclass?.endTime
                      });
                    }
                  },
                  title: 'Add Class Link',
                ),
              ),
              BlocBuilder<BatchCubit, BatchState>(
                builder: (context, state) {
                  if (branchId == null || batch == null) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'Please select branch and batch to show the today\'s class links',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (batchCubit.classLinks == null ||
                      batchCubit.classLinks!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'No classes scheduled for today.',
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Today\'s Online Classes'),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: batchCubit.classLinks?.length ?? 0,
                        itemBuilder: (context, index) {
                          ClassLink classLink = batchCubit.classLinks![index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.liteDark,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        classLink.classDate?.toDateString() ??
                                            'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        '${classLink.branchName}, ${classLink.batchName}, ${classLink.courseName}, ${classLink.subjectName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        '${classLink.classDate?.formattedDay2()} ${classLink.startTime?.toAmPM()}-${classLink.endTime?.toAmPM()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        classLink.link ?? 'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: AppColors.defaultBlue,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RoundButton(
                                      onTap: () {
                                        batchCubit.tempClass = classLink;
                                        Navigator.pushNamed(
                                          context,
                                          EditClassLink.route,
                                          arguments: true,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 35.h,
                                    ),
                                    RoundButton(
                                      onTap: () {
                                        CommonDialog(
                                          context: context,
                                          message:
                                              'Are You Sure You Want To Remove\nClass Link?',
                                          subContent: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text('Date: '),
                                                  Text(
                                                    "${classLink.classDate?.toDateString()}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text('Time: '),
                                                  Text(
                                                    "${classLink.startTime?.toAmPM()} - ${classLink.endTime?.toAmPM()}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${classLink.branchName}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(),
                                              ),
                                              Text(
                                                "${classLink.batchName}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(),
                                              ),
                                              Text(
                                                "${classLink.courseName}, ${classLink.subjectName}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(),
                                              ),
                                              const SizedBox(
                                                height: 32,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            batchCubit.removeClassLink(
                                              classLink.batchId,
                                              classLink.id,
                                            );
                                            Navigator.pop(context);
                                          },
                                        ).show();
                                      },
                                      edit: false,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // String getBatchTime(DateTime date) {
  //   String day = date.toDay().substring(0, 3);

  //   String? str = batch?.days
  //       .firstWhere((element) => element.contains(day), orElse: () => '');
  //   return str ?? '-';
  // }

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
