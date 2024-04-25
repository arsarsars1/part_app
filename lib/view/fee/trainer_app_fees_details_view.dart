import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/fee/components/trainer_app_fee_list_item.dart';
import 'package:part_app/view/fee/trainer_app_add_or_edit_fees.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class TrainerAppFeesDetailsView extends StatefulWidget {
  static const route = '/trainer-app-fees';

  const TrainerAppFeesDetailsView({Key? key}) : super(key: key);

  @override
  State<TrainerAppFeesDetailsView> createState() =>
      _TrainerAppFeesDetailsViewState();
}

class _TrainerAppFeesDetailsViewState extends State<TrainerAppFeesDetailsView> {
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
  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
      var branchCubit = context.read<BranchCubit>();
      authCubit = context.read<AuthCubit>();
      branchId = branchCubit.firstBranch?.id;
      setState(() {
        context.read<BatchCubit>().getBatchesByBranchForTrainer(
              trainerId: authCubit
                      ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                  0,
              branchId: branchId,
              clean: true,
            );
      });
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
            cubit.getFeeDetailsForTrainer(
              trainerId: authCubit
                      ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
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
            cubit.getFeeDetailsForTrainer(
              trainerId: authCubit
                      ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
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
                    SizedBox(
                      height: 20.h,
                    ),
                    TrainerAppBranchField(
                      onSelect: (value) {
                        setState(() {
                          branchId = value;
                        });
                        batchController.clear();
                        feeTypeController.clear();
                        dateController.clear();
                        batch = null;
                        feeType = null;
                        _dropDownKey.currentState?.reset();
                        cubit.batchInvoice.clear();
                        feeTypeController.clear();
                        context.read<BatchCubit>().getBatchesByBranchForTrainer(
                              trainerId: authCubit
                                      ?.user
                                      ?.trainerDetail?[
                                          authCubit?.trainerIndex ?? 0]
                                      .id ??
                                  0,
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
                        feeTypeController.clear();
                        feeType = null;
                        if (branchId != null) {
                          scaffoldKey.currentState?.showBottomSheet(
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            (context) => BatchPicker(
                              branchId: branchId!,
                              status: '',
                              onSelect: (value) {
                                batch = value;
                                batchController.text = value.name;
                                cubit.batchInvoice.clear();
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
                            value: null,
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
                              if (value?.id == 'monthly') {
                                setState(() {
                                  feeType = value?.id;
                                  dateController.clear();
                                  cubit.batchInvoice.clear();
                                });
                              } else {
                                setState(() {
                                  feeType = value?.id;
                                  dateController.clear();
                                  month = null;
                                  year = null;
                                  cubit.batchInvoice.clear();
                                });
                                doSearch(true);
                              }
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
                            dateMonth: true,
                            onDateSelect: (DateTime value) {
                              year = value.year;
                              month = value.month;
                              finalDate = value;
                              cubit.batchInvoice.clear();
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
                              return TrainerAppFeeListItem(
                                student: studentInvoice,
                                onTap: () async {
                                  cubit.student = studentInvoice;
                                  await Navigator.pushNamed(
                                      context, TrainerAppAddOrEditFees.route);
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
    context.read<FeeCubit>().getFeeDetailsForTrainer(
          trainerId: authCubit
                  ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
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
