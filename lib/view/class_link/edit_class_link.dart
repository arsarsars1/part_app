import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/extensions.dart';
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
              batchCubit.tempClass?.batchName != null && batch == null
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
                      // initialValue: batchCubit.tempClass?.batchName ?? "",
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
                            message: batchCubit.tempClass?.batchName != null
                                ? 'Please re-select the Branch.'
                                : 'Please select the Branch.',
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
              batchCubit.tempClass?.classDate != null && date == null
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
                                '${batchCubit.tempClass?.classDate?.toDateString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  datePicker();
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
                      // initialValue: batchCubit.tempClass?.classDate?.toDateString(),
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
                child: Text(
                  date == null
                      ? '${batchCubit.tempClass?.startTime?.toAmPM()}-${batchCubit.tempClass?.endTime?.toAmPM()}'
                      : getBatchTime(date!),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
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
                        'link': classLink ?? batchCubit.tempClass?.link,
                        'service': Uri.parse(
                                classLink ?? batchCubit.tempClass?.link ?? "")
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
