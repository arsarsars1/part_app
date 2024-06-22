import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/class_link/edit_class_link.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassLinkList extends StatefulWidget {
  static const route = '/class-link/list';

  const ClassLinkList({Key? key}) : super(key: key);

  @override
  State<ClassLinkList> createState() => _ClassLinkListState();
}

class _ClassLinkListState extends State<ClassLinkList> {
  int? branchId;
  BatchModel? batch;
  DateTime? date;
  BatchCubit? batchCubit;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool reset = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var branchCubit = context.read<BranchCubit>();
      branchId = branchCubit.firstBranch?.id;
      context.read<BatchCubit>().getBatchesByStatus(
            branchId: branchId,
            clean: true,
            branchSearch: false,
            status: 'ongoing',
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    batchCubit = context.read<BatchCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(title: 'List Online Class Link'),
      body: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          if (state is RemovingLink) {
            Loader(context).show();
          } else if (state is RemovedLink) {
            Navigator.pop(context);
            Alert(context).show(message: 'Class Link Removed');
            batchCubit?.getClassLink(batch?.id, date!);
          } else if (state is RemoveLinkFailed) {
            Navigator.pop(context);
            Alert(context).show(message: 'Failed to remove the link.');
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              BranchField(
                onSelect: (value) {
                  setState(() {
                    branchId = value;
                    batchController.text = "";
                    reset = true;
                  });
                  batchCubit?.getBatchesByStatus(
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
              CommonField(
                controller: batchController,
                onTap: () {
                  if (branchId != null) {
                    scaffoldKey.currentState?.showBottomSheet(
                      backgroundColor: Colors.transparent,
                      (context) => BatchPicker(
                        branchId: branchId!,
                        status: 'ongoing',
                        branchSearch: true,
                        onSelect: (value) {
                          batch = value;
                          batchController.text = value.name;
                          reset = false;
                          if (date != null) {
                            batchCubit?.getClassLink(batch?.id, date!);
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
                title: 'Select Date *',
                hint: 'Select the date',
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 32),
                  child: Icon(
                    Icons.calendar_month,
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Online Classes Scheduled For The Selected Date'),
              ),
              BlocBuilder<BatchCubit, BatchState>(
                builder: (context, state) {
                  if (branchId == null ||
                      batch == null ||
                      date == null ||
                      reset == true) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'Please select branch, batch and date to show the class links',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (batchCubit?.classLinks == null ||
                      batchCubit!.classLinks!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'No matching results found.',
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: batchCubit?.classLinks?.length ?? 0,
                    itemBuilder: (context, index) {
                      ClassLink classLink = batchCubit!.classLinks![index];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      '${classLink.branchName}, ${classLink.batchName}, ${classLink.courseName}, ${classLink.subjectName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(),
                                    ),
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
                                  GestureDetector(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse(classLink.link ?? 'N/A'),
                                      );
                                    },
                                    child: Text(
                                      classLink.link ?? 'N/A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.defaultBlue,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundButton(
                                  onTap: () {
                                    batchCubit?.tempClass = classLink;
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
                                          'Are You Sure You Want To Remove Class Link?',
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
                                        batchCubit?.removeClassLink(
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // method to get the date for [ class-link ]
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
        date = value;
        dateController.text = value.toDateString();
        batchCubit?.getClassLink(batch?.id, date!);
      }
    });
  }
}
