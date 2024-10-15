import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/class_picker.dart';
import 'package:part_app/view/batch/components/manager_app_class_picker.dart';
import 'package:part_app/view/class_link/manager_app_class_link_list.dart';
import 'package:part_app/view/class_link/manager_app_edit_class_link.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/manager_app_branch_field.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerAppClassLinkView extends StatefulWidget {
  static const route = '/manager-app-class-link';
  const ManagerAppClassLinkView({super.key});

  @override
  State<ManagerAppClassLinkView> createState() =>
      _ManagerAppClassLinkViewState();
}

class _ManagerAppClassLinkViewState extends State<ManagerAppClassLinkView> {
  int? branchId;
  BatchModel? batch;
  DateTime? date;
  String? classLink;
  List<String>? batchDays = [];
  ClassModel? selectedclass;
  FocusNode linkFocus = FocusNode();
  AuthCubit? authCubit;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      authCubit = context.read<AuthCubit>();
      var branchCubit = context.read<BranchCubit>();
      var batchCubit = context.read<BatchCubit>();
      await branchCubit.getBranchesForManager(
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
      );
      branchId = branchCubit.firstBranch?.id;
      await batchCubit.getBatchesByStatusForManager(
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
        branchId: branchId,
        clean: true,
        branchSearch: false,
        status: 'ongoing',
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var batchCubit = context.read<BatchCubit>();
    return WillPopScope(
      onWillPop: () async {
        batchCubit.classLinks;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
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
              batchCubit.getClassLinkForManager(
                  authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0]
                          .id ??
                      0,
                  batch?.id,
                  DateTime.now());
              Alert(context).show(message: 'Class Link Added');
              formKey.currentState?.reset();
              batchController.clear();
              dateController.clear();
              date = null;
              branchId = null;
              setState(() {});
            } else if (state is AddLinkFailed) {
              Navigator.pop(context);
              Alert(context).show(message: state.message);
            } else if (state is FetchingLinks || state is RemovingLink) {
              Loader(context).show();
            } else if (state is RemovedLink) {
              Navigator.pop(context);
              Alert(context).show(message: 'Online Class Deleted');
              batchCubit.getClassLinkForManager(
                  authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0]
                          .id ??
                      0,
                  batch?.id,
                  DateTime.now());
            } else if (state is RemoveLinkFailed) {
              Alert(context).show(message: state.message);
            } else if (state is FetchedLinks) {
              Navigator.pop(context);
            }
          },
          child: Form(
            key: formKey,
            child: ListView(
              controller: _scrollController,
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
                      height: UIConstants.buttonHeight,
                      onTap: () {
                        Navigator.pushNamed(
                            context, ManagerAppClassLinkList.route);
                      },
                      title: 'List Online Classes',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  node: linkFocus,
                  title: 'Online Class Link *',
                  hint: 'Enter the class link',
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
                ManagerAppBranchField(
                  onSelect: (value) {
                    // if (branchId != null) {
                    //   AlertBox.showConfirmation(
                    //     message:
                    //         'Are your sure, that you need to change the branch',
                    //     subMessage:
                    //         'Note: Please be aware that when you change the branch, the underlying batch, date and selected class will be also cleared',
                    //     buttonText: 'OK',
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //       setState(() {
                    //         batch = null;
                    //         batchController.text = "";
                    //         dateController.text = "";
                    //         selectedclass = null;
                    //         date = null;
                    //       });
                    //     },
                    //     hasClose: true,
                    //     context,
                    //   );
                    // }
                    setState(() {
                      branchId = value;
                      batch = null;
                      batchController.text = "";
                      dateController.text = "";
                      selectedclass = null;
                      date = null;
                    });
                    batchCubit.getBatchesByStatusForManager(
                      managerId: authCubit
                              ?.user
                              ?.managerDetail?[authCubit?.managerIndex ?? 0]
                              .id ??
                          0,
                      branchId: branchId,
                      clean: true,
                      branchSearch: false,
                      status: 'ongoing',
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
                          status: 'ongoing',
                          branchSearch: true,
                          onSelect: (value) async {
                            batch = value;
                            batchController.text = value.name;
                            for (var element in batch!.days) {
                              batchDays?.add(element.split(" ")[0]);
                            }
                            await batchCubit.getClassLinkForManager(
                                authCubit
                                        ?.user
                                        ?.managerDetail?[
                                            authCubit?.managerIndex ?? 0]
                                        .id ??
                                    0,
                                batch?.id,
                                DateTime.now());
                            setState(() {
                              date = null;
                              selectedclass = null;
                            });
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
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          date == null
                              ? Text(
                                  'Select the date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColors.grey700,
                                      ),
                                )
                              : Text(
                                  '${date?.toDateString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColors.grey400,
                                      ),
                                ),
                          GestureDetector(
                            onTap: () async {
                              await datePicker();
                              dateController.text = date?.toDateString() ?? "";
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
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Selected Class'),
                  ),
                ),
                date == null || selectedclass == null
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
                              "${date?.formattedDay2()} ${selectedclass?.startTime.toAmPM()} - ${selectedclass?.endTime.toAmPM()}",
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
                    height: UIConstants.buttonHeight,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // formKey.currentState!.save();
                        if (classLink == "") {
                          _scrollController.animateTo(
                            linkFocus.offset.dy,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                          linkFocus.requestFocus();
                          return;
                        }
                        batchCubit.addClassLinkForManager(
                            authCubit
                                    ?.user
                                    ?.managerDetail?[
                                        authCubit?.managerIndex ?? 0]
                                    .id ??
                                0,
                            batch?.id,
                            {
                              'class_date': date?.toServerYMD(),
                              'link': classLink?.contains("https://") ?? false
                                  ? classLink
                                  : classLink?.contains("http://") ?? false
                                      ? classLink
                                      : "https://$classLink",
                              'service': Uri.parse(classLink
                                              ?.contains("https://") ??
                                          false
                                      ? classLink ?? ""
                                      : classLink?.contains("http://") ?? false
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
                                              .bodyLarge
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
                                              .bodyLarge
                                              ?.copyWith(),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${classLink.classDate?.formattedDay2()} ${classLink.startTime?.toAmPM()}-${classLink.endTime?.toAmPM()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          classLink.link ?? 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
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
                                            ManagerAppEditClassLink.route,
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
                                                          .bodyLarge
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
                                                          .bodyLarge
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
                                                      .bodyLarge
                                                      ?.copyWith(),
                                                ),
                                                Text(
                                                  "${classLink.batchName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(),
                                                ),
                                                Text(
                                                  "${classLink.courseName}, ${classLink.subjectName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(),
                                                ),
                                                const SizedBox(
                                                  height: 32,
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              batchCubit
                                                  .removeClassLinkForManager(
                                                authCubit
                                                        ?.user
                                                        ?.managerDetail?[authCubit
                                                                ?.managerIndex ??
                                                            0]
                                                        .id ??
                                                    0,
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
        if (!batchDays!.contains(value.formattedDay2())) {
          Alert(context).show(
            message: 'Selected batch does not have class on selected date',
          );
          return;
        }
        date = value;
        dateController.text = value.toDateString();
        setState(() {});
        scaffoldKey.currentState?.showBottomSheet(
          enableDrag: false,
          elevation: 10,
          backgroundColor: Colors.transparent,
          (context) => ManagerAppClassPicker(
            branchId: batch?.branchId,
            batchId: batch?.id,
            date: date?.toServerYMD(),
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
      }
    });
  }
}
