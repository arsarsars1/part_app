import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/view/batch/components/schedule_field.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view/fee/components/fee_list_item.dart';
import 'package:part_app/view/students/widgets/batch_picker.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

import '../../model/data_model/fee_response.dart';

class FeesDetailsView extends StatefulWidget {
  static const route = '/fees';

  const FeesDetailsView({Key? key}) : super(key: key);

  @override
  State<FeesDetailsView> createState() => _FeesDetailsViewState();
}

class _FeesDetailsViewState extends State<FeesDetailsView> {
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? status;
  int? branchId;
  String? query;
  BatchModel? batch;

  int? year;
  int? month;
  DateTime? finalDate = DateTime.now();
  String? feeType;

  TextEditingController batchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FeeCubit>().clean();
    });
    // Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        doSearch(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CommonBar(
        title: 'Fees Details',
      ),
      body: BlocBuilder<FeeCubit, FeeState>(
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
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Fee Details',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    BranchField(
                      onSelect: (value) {
                        setState(() {
                          branchId = value;
                        });
                        batchController.clear();
                        feeTypeController.clear();
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
                        feeTypeController.clear();
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
                    CommonField(
                      controller: feeTypeController,
                      title: 'Fee Type *',
                      hint: 'Select Fee Type',
                      dropDown: true,
                      dropDownItems: DefaultValues().feeType,
                      onChange: (value) {
                        feeType = value.id;
                        dateController.clear();
                      },
                      validator: (value) {
                        return value == null ? 'Please select Fee Type.' : null;
                      },
                      onSubmit: (value) {},
                    ),
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
                        doSearch(true);
                      },
                      time: false,
                      onlyMonth: true,
                      selectedDate: finalDate,
                      controller: dateController,
                    ),
                    const SizedBox(
                      height: 10,
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
                    Column(
                      children: [
                        cubit.batchInvoice == null || cubit.batchInvoice.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(64),
                                child: Center(
                                  child: Text(
                                    query == null
                                        ? 'Add a student to get started'
                                        : state is StudentsFetched
                                            ? 'Sorry, No matching results found'
                                            : 'Select a batch to list the students.',
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.batchInvoice.length ?? 0,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Datum studentInvoice =
                                      cubit.batchInvoice[index];
                                  return FeeListItem(
                                    student: studentInvoice,
                                    onTap: () {},
                                  );
                                },
                              ),
                      ],
                    )
                  ],
                ),
              ),
              AnimatedContainer(
                height: state is FetchingFee && state.pagination ? 30 : 0,
                color: Colors.black,
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: const Center(child: Text('Fetching more items ..')),
              )
            ],
          );
        },
      ),
    );
  }

  void doSearch(bool clean) {
    context.read<FeeCubit>().getFeeDetails(
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
