import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/manager_app_branch_field.dart';
import 'package:part_app/view/fee/components/manager_app_fee_list_item.dart';
import 'package:part_app/view/fee/manager_app_add_or_edit_fees.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class ManagerAppFeesDetailsView extends StatefulWidget {
  static const route = '/manager-app-fees';

  const ManagerAppFeesDetailsView({super.key});

  @override
  State<ManagerAppFeesDetailsView> createState() =>
      _ManagerAppFeesDetailsViewState();
}

class _ManagerAppFeesDetailsViewState extends State<ManagerAppFeesDetailsView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;
  BatchModel? batch;
  AuthCubit? authCubit;
  int? year;
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType;
  final _dropDownKey = GlobalKey<FormFieldState>();
  bool branchSelected = false;
  int? selectedItemValue;
  BranchCubit? branchCubit;
  TextEditingController branchController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
      branchCubit = context.read<BranchCubit>();
      authCubit = context.read<AuthCubit>();
      branchCubit?.getBranchesForManager(
        managerId:
            authCubit?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                0,
      );
      doSearch(true);
      // branchId = branchCubit.firstBranch?.id;
      // setState(() {
      //   context.read<BatchCubit>().getBatchesByBranchForTrainer(
      //         trainerId: authCubit
      //                 ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
      //             0,
      //         branchId: branchId,
      //         clean: true,
      //       );
      // });
      batchController.text = 'All';
      feeTypeController.text = 'All';
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Fees Details',
      ),
      body: BlocConsumer<FeeCubit, FeeState>(
        listener: (context, state) {
          var cubit = context.read<FeeCubit>();
          if (state is FeeReminderSent) {
            Alert(context).show(message: state.message);
            cubit.getFeeDetailsForManager(
              managerId: authCubit
                      ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                  0,
              branchId: branchId,
              batchId: batch?.id,
              month: month,
              year: year,
              feeType: feeType,
              searchQuery: query,
              clean: true,
            );
          } else if (state is FeeReminderSentFailed) {
            Alert(context).show(message: state.message);
          } else if (state is WrittenOff) {
            Alert(context).show(message: state.message);
            cubit.getFeeDetailsForManager(
              managerId: authCubit
                      ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
                  0,
              branchId: branchId,
              batchId: batch?.id,
              month: month,
              year: year,
              feeType: feeType,
              searchQuery: query,
              clean: true,
            );
          } else if (state is WriteOffFailed) {
            Alert(context).show(message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = context.read<FeeCubit>();
          return Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select The Following Filters To Get The',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Fee Details',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(height: 20.h),
                    ManagerAppBranchField(
                      addAllItem: true,
                      initialBranch: selectedItemValue ?? -1,
                      onSelect: (value) {
                        if (value == -1) {
                          branchSelected = false;
                          batchController.text = 'All';
                          branchId = null;
                          batch = null;
                          year = month = finalDate = feeType = query = null;
                          _dropDownKey.currentState?.reset();
                          searchController.clear();
                          cubit.batchInvoice.clear();
                          setState(() {});
                        } else {
                          branchSelected = true;
                          selectedItemValue = value;
                          setState(() {
                            branchId = value;
                          });
                          batchController.clear();
                          feeTypeController.clear();
                          dateController.clear();
                          batch = null;
                          _dropDownKey.currentState?.reset();
                          cubit.batchInvoice.clear();
                          feeTypeController.clear();
                          context
                              .read<BatchCubit>()
                              .getBatchesByBranchForTrainer(
                                trainerId: authCubit
                                        ?.user
                                        ?.trainerDetail?[
                                            authCubit?.trainerIndex ?? 0]
                                        .id ??
                                    0,
                                branchId: branchId,
                                clean: true,
                              );
                          doSearch(true);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      controller: batchController,
                      onTap: () {
                        if (branchId != null) {
                          scaffoldKey.currentState?.showBottomSheet(
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => BatchPicker(
                              branchId: branchId!,
                              status: 'ongoing',
                              onSelect: (value) {
                                batch = value;
                                batchController.text = value.name;
                                cubit.batchInvoice.clear();
                                year =
                                    month = finalDate = feeType = query = null;
                                searchController.clear();
                                dateController.clear();
                                feeTypeController.clear();
                                feeType = null;
                                doSearch(true);
                                // setState(() {});
                              },
                            ),
                          );
                        } else {
                          Alert(context).show(
                            message: 'Please select Branch and Status.',
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fee Type *',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownButtonFormField<DropDownItem>(
                            key: _dropDownKey,
                            validator: (value) {
                              return value == null
                                  ? 'Please select Fee Type.'
                                  : null;
                            },
                            hint: Text(
                              'Select Fee Type',
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .hintStyle,
                            ),
                            dropdownColor: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            value: feeType != null
                                ? DefaultValues()
                                    .feeType
                                    .where((test) => test.id == feeType)
                                    .first
                                : DefaultValues().feeType[0],
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 32),
                            ),
                            items: DefaultValues().feeType.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              dateController.clear();
                              searchController.clear();
                              year = month = finalDate = query = null;
                              feeType = value?.id;
                              cubit.batchInvoice.clear();
                              doSearch(true);
                            },
                          ),
                        ],
                      ),
                    ),
                    if (feeType == "monthly")
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ScheduleField(
                            title: 'Month, Year',
                            hint: 'Select month & year',
                            initialValue: dateController.text,
                            dateMonth: true,
                            onDateSelect: (DateTime value) {
                              year = value.year;
                              month = value.month;
                              finalDate = value;
                              dateController.text = value.toMMMMYYYY();
                              cubit.batchInvoice.clear();
                              searchController.clear();
                              query = null;
                              setState(() {});
                              doSearch(true);
                            },
                            time: false,
                            onlyMonth: true,
                            selectedDate: finalDate,
                            controller: dateController,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonField(
                      title: 'Search',
                      hint: 'Search By Name or Phone Number',
                      controller: searchController,
                      onChange: (value) {},
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
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is FetchingFee && !state.pagination)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (state is FeeReminderSending || state is WritingOff)
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    cubit.batchInvoice.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(64),
                            child: Center(
                              child: Text(
                                state is FeeFetched
                                    ? 'Sorry, No matching results found'
                                    : 'Select the details from above',
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.batchInvoice.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Datum studentInvoice = cubit.batchInvoice[index];
                              return ManagerAppFeeListItem(
                                student: studentInvoice,
                                onTap: () async {
                                  cubit.student = studentInvoice;
                                  await Navigator.pushNamed(
                                      context, ManagerAppAddOrEditFees.route);
                                  doSearch(true);
                                },
                              );
                            },
                          ),
                    if (state is FetchingFee && state.pagination)
                      const Center(
                        child: Text('Fetching more items ..'),
                      )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<FeeCubit>().getFeeDetailsForManager(
          managerId: authCubit
                  ?.user?.managerDetail?[authCubit?.managerIndex ?? 0].id ??
              0,
          branchId: branchId,
          batchId: batch?.id,
          month: month,
          year: year,
          feeType: feeType,
          searchQuery: query,
          clean: clean,
        );
  }
}
