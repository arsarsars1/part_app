import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/lead_statuses.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/manager/leads/manager_app_lead_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/lead_utils.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/leads/leads_cubit.dart';

class ManagerAppAllFollowUpView extends StatefulWidget {
  static const route = '/leads/manager-app-all-followups';

  const ManagerAppAllFollowUpView({super.key});

  @override
  State<ManagerAppAllFollowUpView> createState() =>
      _ManagerAppAllFollowUpViewState();
}

class _ManagerAppAllFollowUpViewState extends State<ManagerAppAllFollowUpView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<LeadStatus?>? status;
  AuthCubit? authCubit;
  String? leadStatus;
  int? branchId;
  String? query;
  BatchModel? batch;
  DateTime? date;
  TextEditingController branchController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchLead();
    });
  }

  Future<void> fetchLead({bool getStatus = true}) async {
    var lead = context.read<LeadsCubit>();
    await lead.getLeadsListsForManager(
      clean: true,
      managerId:
          authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ?? 0,
    );
    if (getStatus) {
      await lead.getLeadStatusesForManager(
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LeadsCubit>();

    return WillPopScope(
      onWillPop: () async {
        cubit.leads.clear();
        Navigator.pop(context);
        return false;
      },
      child: BlocConsumer<LeadsCubit, LeadsState>(
          listener: (context, state) {},
          builder: (context, state) {
            status = cubit.statuses;
            return Scaffold(
              key: scaffoldKey,
              appBar: CommonBar(
                title: 'Leads',
                onPressed: () {
                  cubit.leads.clear();
                  Navigator.pop(context);
                },
                actions: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              endDrawer: Drawer(
                backgroundColor: Colors.black,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SafeArea(
                      child: SizedBox(
                        height: kToolbarHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Filter',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    leadStatus = null;
                                    branchId = null;
                                    batchController.clear();
                                    date = null;
                                    query = null;
                                  });
                                  fetchLead(getStatus: false);
                                  scaffoldKey.currentState?.closeDrawer();
                                },
                                icon: const Icon(
                                  Icons.filter_alt_off,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    CommonField(
                      title: 'Lead Status',
                      hint: 'Select status',
                      length: 50,
                      maxLines: 1,
                      dropDown: true,
                      defaultItem:
                          LeadUtils().getSelectedItem(leadStatus, status),
                      dropDownItems: status
                          ?.map((e) => DropDownItem(
                              id: e?.slug, title: e?.leadStatus, item: e))
                          .toList(),
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        setState(() {
                          leadStatus = value?.title;
                          branchId = null;
                          batch = null;
                          batchController.clear();
                          date = null;
                        });
                        doSearch(true);
                      },
                    ),
                    SizedBox(height: 20.h),
                    BranchField(
                      clearInitial: branchId == null,
                      isMandatory: false,
                      initialBranch: branchId,
                      contentPaddingField:
                          const EdgeInsets.symmetric(horizontal: 28),
                      onSelect: (value) {
                        branchId = value;
                        batchController.clear();
                        batch = null;
                        date = null;

                        setState(() {});
                        context.read<BatchCubit>().getBatchesByBranchForManager(
                              managerId: authCubit
                                      ?.user
                                      ?.managerDetail?[
                                          authCubit?.managerIndex ?? 0]
                                      .id ??
                                  0,
                              branchId: branchId,
                              clean: true,
                            );
                        cubit.leads.clear();
                        doSearch(true);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      controller: batchController,
                      onTap: () {
                        if (branchId != null) {
                          // if (_scaffoldKey.currentState != null && _scaffoldKey.currentState!.isDrawerOpen) {
                          //   Navigator.of(context).pop(); // Close the drawer
                          // }
                          // scaffoldKey.currentState?.showBottomSheet(
                          //   elevation: 10,
                          //   backgroundColor: Colors.transparent,
                          //   (context) => BatchPicker(
                          //     branchId: branchId ?? 0,
                          //     status: '',
                          //     onSelect: (value) {
                          //       batch = value;
                          //       batchController.text = value.name;
                          //       cubit.leads.clear();
                          //       // setState(() {});
                          //     },
                          //   ),
                          // );
                          Future.delayed(const Duration(milliseconds: 300), () {
                            showModalBottomSheet(
                              context: context,
                              elevation: 10,
                              builder: (context) => Container(
                                color: Colors.transparent,
                                child: BatchPicker(
                                  branchId: branchId ?? 0,
                                  status: 'ongoing',
                                  onSelect: (value) {
                                    batch = value;
                                    batchController.text = value.name;
                                    doSearch(true);
                                  },
                                ),
                              ),
                            );
                          });
                          setState(() {
                            date = null;
                          });
                        } else {
                          Alert(context).show(
                            message: 'Please select Branch.',
                          );
                        }
                      },
                      contentPaddingField:
                          const EdgeInsets.symmetric(horizontal: 28),
                      disabled: true,
                      title: 'Batch',
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
                            'Date',
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
                                  dateController.text =
                                      date?.toDateString() ?? "";
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
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CommonField(
                      title: 'Search',
                      hint: 'Search By Name or Phone Number',
                      onChange: (value) {
                        // if (value.isEmpty) {
                        //   query = null;
                        //   doSearch(true);
                        // }
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
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.leads.length,
                            itemBuilder: (context, index) {
                              Lead? singleLead = cubit.leads[index];
                              return GestureDetector(
                                onTap: () {
                                  cubit.selectedLead = singleLead;
                                  Navigator.pushNamed(
                                          context, ManagerAppLeadDetails.route)
                                      .then((onValue) {
                                    fetchLead(getStatus: false);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: AppColors.liteDark,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name: ${singleLead?.name ?? 'Not available'}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primaryColor,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Lead Status: ${singleLead?.leadStatus ?? 'Not available'}",
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Next Followup on: ${cubit.checkTime(singleLead?.followUps ?? [])?.followUpDate?.toDateString() != null ? '${cubit.checkTime(singleLead?.followUps ?? [])?.followUpDate?.toDateString() == DateTime.now().toDateString() ? "Today" : cubit.checkTime(singleLead?.followUps ?? [])?.followUpDate?.toDateString()} @ ${cubit.checkTime(singleLead?.followUps ?? [])?.followUpTime?.toAmPM()}' : "Not available"}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: cubit
                                                              .checkTime(singleLead
                                                                      ?.followUps ??
                                                                  [])
                                                              ?.followUpDate
                                                              ?.toDateString() ==
                                                          DateTime.now()
                                                              .toDateString()
                                                      ? AppColors.yellow
                                                      : AppColors.textColor,
                                                ),
                                          ),
                                        ],
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
                ),
              ),
            );
          }),
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
    context.read<LeadsCubit>().getLeadsListForManager(
          managerId: authCubit
                  ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
              0,
          branchId: branchId,
          batchId: batch?.id,
          date: date?.toServerYMD(),
          leadStatus: leadStatus,
          searchQuery: query,
          clean: clean,
        );
  }
}
