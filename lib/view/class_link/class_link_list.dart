import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/class_link/class_link_view.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/round_button.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';

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
                  });
                  batchCubit?.getBatchesByStatus(
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
                title: 'From Date *',
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
              const SizedBox(
                height: 20,
              ),
              CommonField(
                controller: dateController,
                title: 'To Date *',
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Online Classes Scheduled For The Selected\nDates'),
              ),
              BlocBuilder<BatchCubit, BatchState>(
                builder: (context, state) {
                  if (branchId == null || batch == null || date == null) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(64.0),
                        child: Text(
                          'Please select batch, branch to show the class links',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (batchCubit?.classLinks == null ||
                      batchCubit!.classLinks!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(64.0),
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
                      ClassLink classLink = batchCubit!.classLinks![0];
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
                                    classLink.batchDate?.toDateString() ??
                                        'N/A',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
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
                              children: [
                                RoundButton(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ClassLinkView.route,
                                      arguments: true,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
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
                                                classLink.batchDate
                                                        ?.toDateString() ??
                                                    'N/A',
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
                                          const SizedBox(
                                            height: 32,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        batchCubit?.removeClassLint(
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

  // method to get the date for [ dob ]
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
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 2,
      ),
    ).then((value) {
      if (value != null) {
        date = value;
        dateController.text = value.toDateString();
        batchCubit?.getClassLink(batch?.id, date!);
      }
    });
  }
}
