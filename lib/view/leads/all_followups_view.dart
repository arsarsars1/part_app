import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/lead_statuses.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/alert.dart';
import 'package:part_app/view/components/branch_field.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/common_field.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/leads/lead_details.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class AllFollowUpView extends StatefulWidget {
  static const route = '/leads/all-followups';

  const AllFollowUpView({Key? key}) : super(key: key);

  @override
  State<AllFollowUpView> createState() => _TodayFollowViewState();
}

class _TodayFollowViewState extends State<AllFollowUpView> {
  final _dropDownKey = GlobalKey<FormFieldState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<LeadStatus?>? status;

  String? leadStatus;
  int? branchId;
  String? query;
  BatchModel? batch;
  DateTime? date;
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LeadsCubit>().getLeadStatuses();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LeadsCubit>();

    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(title: 'Leads'),
      body: BlocConsumer<LeadsCubit, LeadsState>(
        listener: (context, state) {},
        builder: (context, state) {
          status = cubit.statuses;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Status *',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField<DropDownItem>(
                      key: _dropDownKey,
                      validator: (value) {
                        return value == null
                            ? 'Please select lead status.'
                            : null;
                      },
                      hint: Text(
                        'Select Lead Status',
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      dropdownColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      value: null,
                      decoration: const InputDecoration(
                          // contentPadding: padding,
                          ),
                      items: status
                          ?.map((e) => DropDownItem(
                              id: e?.slug, title: e?.leadStatus, item: e))
                          .toList()
                          .map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.title ?? '',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          leadStatus = value?.id;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              BranchField(
                onSelect: (value) {
                  setState(() {
                    branchId = value;
                  });
                  batchController.clear();
                  dateController.clear();
                  batch = null;
                  context.read<BatchCubit>().getBatchesByBranch(
                        branchId: branchId,
                        clean: true,
                      );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                controller: batchController,
                onTap: () {
                  dateController.clear();
                  if (branchId != null) {
                    scaffoldKey.currentState?.showBottomSheet(
                      elevation: 10,
                      backgroundColor: Colors.transparent,
                      (context) => BatchPicker(
                        branchId: branchId ?? 0,
                        status: '',
                        onSelect: (value) {
                          batch = value;
                          batchController.text = value.name;
                          // setState(() {});
                        },
                      ),
                    );
                  } else {
                    Alert(context).show(
                      message: 'Please select Branch.',
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
                  return value == null ? 'Please select batch.' : null;
                },
              ),
              SizedBox(height: 20.h),
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
              SizedBox(height: 20.h),
              CommonField(
                disabled: batch == null,
                title: 'Search',
                hint: 'Search By Name or Phone Number',
                onChange: (value) {
                  if (value.isEmpty) {
                    query = null;
                    doSearch(true);
                  }
                },
                onSubmit: (value) {
                  if (value.isEmpty) {
                    query = null;
                  } else {
                    query = value;
                  }
                  doSearch(true);
                },
                textInputAction: TextInputAction.search,
                prefixIcon: const Icon(Icons.search),
              ),
              SizedBox(height: 20.h),
              cubit.leads.isEmpty
                  ? const Center(
                      child: Text('No followups'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.leads.length,
                      itemBuilder: (context, index) {
                        Lead lead = cubit.leads[index];
                        return GestureDetector(
                          onTap: () {
                            cubit.selectedLead = lead;
                            Navigator.pushNamed(context, LeadDetails.route);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: AppColors.liteDark,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lead.name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        lead.leadStatus ?? '',
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    'Not Interested',
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
            ],
          );
        },
      ),
    );
  }

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
        date = value;
        dateController.text = value.toDateString();
        setState(() {});
        doSearch(true);
      }
    });
  }

  void doSearch(bool clean) {
    context.read<LeadsCubit>().getLeadsList(
          branchId: branchId,
          batchId: batch?.id,
          date: date?.toServerYMD(),
          leadStatus: leadStatus,
          searchQuery: query,
          clean: clean,
        );
  }
}
