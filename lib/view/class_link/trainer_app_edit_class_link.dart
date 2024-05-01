import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/class_picker.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppEditClassLink extends StatefulWidget {
  static const route = '/trainer-app-edit-class-link';

  const TrainerAppEditClassLink({Key? key}) : super(key: key);

  @override
  State<TrainerAppEditClassLink> createState() =>
      _TrainerAppEditClassLinkState();
}

class _TrainerAppEditClassLinkState extends State<TrainerAppEditClassLink> {
  int? branchId;
  BatchModel? batch;
  int? batchId;
  DateTime? date;
  String? classLink;
  List<String>? batchDays = [];
  ClassModel? selectedclass;
  late BatchCubit batchCubit;
  ClassLink? tempClass;
  AuthCubit? authCubit;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    batchCubit = context.read<BatchCubit>();
    tempClass = batchCubit.tempClass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        batchCubit.classLinks;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
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
              batchCubit.getClassLinkForTrainer(
                  authCubit?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0]
                          .id ??
                      0,
                  batchCubit.tempClass?.batchId,
                  tempClass?.classDate ?? DateTime.now());
              Alert(context).show(message: 'Class link updated');
              formKey.currentState?.reset();
              branchId = null;
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
                  initialValue: tempClass?.link,
                  onChange: (value) {
                    classLink = value;
                  },
                  capitalization: TextCapitalization.none,
                  validator: (value) {
                    bool validUrl;
                    if (value.contains("https://") ||
                        value.contains("http://")) {
                      validUrl = Uri.parse(value).isAbsolute;
                    } else {
                      value = "https://$value";
                      validUrl = Uri.parse(value).isAbsolute;
                    }

                    return !validUrl ||
                            value == "https://" ||
                            value == "http://"
                        ? 'Please enter a valid class link.'
                        : null;
                  },
                  onSubmit: (value) {
                    classLink = value;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                tempClass != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              'Branch *',
                              style: Theme.of(context).textTheme.bodyLarge,
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
                                  '${tempClass?.branchName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AlertBox.showConfirmation(
                                      message:
                                          'Are your sure, that you need to change the branch',
                                      subMessage:
                                          'Note: Please be aware that when you change the branch, the underlying batch, date and selected class will be also cleared',
                                      buttonText: 'OK',
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          tempClass = null;
                                        });
                                      },
                                      hasClose: true,
                                      context,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    size: 24,
                                    color: Colors.white24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : BranchField(
                        initialBranch: branchId,
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
                          batchCubit.getBatchesByStatusForTrainer(
                            trainerId: authCubit
                                    ?.user
                                    ?.trainerDetail?[
                                        authCubit?.trainerIndex ?? 0]
                                    .id ??
                                0,
                            branchId: branchId,
                            clean: true,
                            branchSearch: false,
                            status: 'ongoing',
                          );
                        },
                      ),
                SizedBox(
                  height: 20.h,
                ),
                tempClass != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              'Batch *',
                              style: Theme.of(context).textTheme.bodyLarge,
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
                                  '${tempClass?.batchName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AlertBox.showConfirmation(
                                      message:
                                          'Are your sure, that you need to change the batch',
                                      subMessage:
                                          'Note: Please be aware that when you change the batch, the underlying date and selected class will be also cleared',
                                      buttonText: 'OK',
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          branchId = (context
                                                  .read<BranchCubit>()
                                                  .branches
                                                  .where((element) =>
                                                      element.branchName ==
                                                      batchCubit.tempClass
                                                          ?.branchName)
                                                  .toList())[0]
                                              .id;
                                          tempClass = null;
                                        });
                                        batchCubit.getBatchesByStatusForTrainer(
                                          trainerId: authCubit
                                                  ?.user
                                                  ?.trainerDetail?[
                                                      authCubit?.trainerIndex ??
                                                          0]
                                                  .id ??
                                              0,
                                          branchId: branchId,
                                          clean: true,
                                          branchSearch: true,
                                        );
                                      },
                                      hasClose: true,
                                      context,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
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
                tempClass != null
                    ? Column(
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
                                  '${date?.toDateString() ?? tempClass?.classDate?.toDateString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AlertBox.showConfirmation(
                                      message:
                                          'Are your sure, that you need to change the date',
                                      subMessage:
                                          'Note: Please be aware that when you change the date, the underlying selected class will be also cleared',
                                      buttonText: 'OK',
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          branchId = (context
                                                  .read<BranchCubit>()
                                                  .branches
                                                  .where((element) =>
                                                      element.branchName ==
                                                      batchCubit.tempClass
                                                          ?.branchName)
                                                  .toList())[0]
                                              .id;
                                          batchController.text =
                                              tempClass?.batchName ?? "";
                                          batchId = tempClass?.batchId;
                                          tempClass = null;
                                        });
                                        batchCubit.getBatchesByStatusForTrainer(
                                          trainerId: authCubit
                                                  ?.user
                                                  ?.trainerDetail?[
                                                      authCubit?.trainerIndex ??
                                                          0]
                                                  .id ??
                                              0,
                                          branchId: branchId,
                                          clean: true,
                                          branchSearch: true,
                                        );
                                      },
                                      hasClose: true,
                                      context,
                                    );
                                    // datePicker().then((value) {
                                    //   date = DateTime.parse(value ?? "");
                                    //   dateController.text =
                                    //       date?.toDateString() ?? "";
                                    //   setState(() {
                                    //     selectedclass = null;
                                    //   });
                                    //   scaffoldKey.currentState?.showBottomSheet(
                                    //     enableDrag: false,
                                    //     elevation: 10,
                                    //     backgroundColor: Colors.transparent,
                                    //     (context) => ClassPicker(
                                    //       branchId: batch?.branchId,
                                    //       batchId:
                                    //           batch?.id ?? tempClass?.batchId,
                                    //       date: date?.toServerYMD() ??
                                    //           tempClass?.classDate?.toServerYMD(),
                                    //       scaffoldKey: scaffoldKey,
                                    //       onSave: (ClassModel value) {
                                    //         setState(() {
                                    //           // dateController.text =
                                    //           //     date?.toDDMMYYY() ?? "";
                                    //           selectedclass = value;
                                    //         });
                                    //       },
                                    //     ),
                                    //   );
                                    // });
                                  },
                                  child: const Icon(
                                    Icons.edit,
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
                        controller: dateController,
                        onSelect: (String value) {
                          date = DateTime.parse(value);
                          scaffoldKey.currentState?.showBottomSheet(
                            enableDrag: false,
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => ClassPicker(
                              branchId: batch?.branchId,
                              batchId:
                                  batch?.id ?? tempClass?.batchId ?? batchId,
                              date: date?.toServerYMD() ??
                                  tempClass?.classDate?.toServerYMD(),
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
                tempClass == null && selectedclass == null
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
                              'No class selected',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(),
                            ),
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
                              "${date?.formattedDay2() ?? tempClass?.classDate?.formattedDay2()} ${selectedclass?.startTime.toAmPM() ?? tempClass?.startTime?.toAmPM()} - ${selectedclass?.endTime.toAmPM() ?? tempClass?.endTime?.toAmPM()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(),
                            ),
                            GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState?.showBottomSheet(
                                  enableDrag: false,
                                  elevation: 10,
                                  backgroundColor: Colors.transparent,
                                  (context) => ClassPicker(
                                    branchId: batch?.branchId,
                                    batchId: batch?.id ??
                                        tempClass?.batchId ??
                                        selectedclass?.batchId,
                                    date: date?.toServerYMD() ??
                                        tempClass?.classDate?.toServerYMD(),
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
                        // formKey.currentState!.save();

                        batchCubit.updateClassLinkForTrainer(
                          authCubit
                                  ?.user
                                  ?.trainerDetail?[authCubit?.trainerIndex ?? 0]
                                  .id ??
                              0,
                          batchCubit.tempClass?.batchId,
                          batchCubit.tempClass?.id,
                          {
                            'class_date': date?.toServerYMD() ??
                                tempClass?.classDate?.toServerYMD(),
                            'link': (classLink ?? batchCubit.tempClass?.link)
                                        ?.contains("https://") ??
                                    false
                                ? classLink ?? batchCubit.tempClass?.link
                                : (classLink ?? batchCubit.tempClass?.link)
                                            ?.contains("http://") ??
                                        false
                                    ? classLink ?? batchCubit.tempClass?.link
                                    : "https://${classLink ?? batchCubit.tempClass?.link}",
                            'service': Uri.parse((classLink ??
                                                batchCubit.tempClass?.link)
                                            ?.contains("https://") ??
                                        false
                                    ? classLink ??
                                        batchCubit.tempClass?.link ??
                                        ""
                                    : (classLink ?? batchCubit.tempClass?.link)
                                                ?.contains("http://") ??
                                            false
                                        ? classLink ??
                                            batchCubit.tempClass?.link ??
                                            ""
                                        : "https://${classLink ?? batchCubit.tempClass?.link ?? ""}")
                                .host,
                            'start_time': selectedclass?.startTime ??
                                tempClass?.startTime,
                            'end_time':
                                selectedclass?.endTime ?? tempClass?.endTime,
                            "batch_id":
                                batch?.id ?? batchCubit.tempClass?.batchId,
                          },
                        );
                      }
                    },
                    title: 'Update Class Link',
                  ),
                ),
              ],
            ),
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
