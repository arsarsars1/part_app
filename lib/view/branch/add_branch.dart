import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/view/branch/components/enable_switch.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class AddBranch extends StatefulWidget {
  static const route = '/branch/create';

  final bool addBranch;

  const AddBranch({Key? key, this.addBranch = true}) : super(key: key);

  @override
  State<AddBranch> createState() => _AddBranchState();
}

class _AddBranchState extends State<AddBranch> {
  String branchName = '';
  String address = '';
  int? countryId;
  int? stateId;
  int? districtId;
  String pinCode = '';

  final formKey = GlobalKey<FormState>();
  FocusNode pinFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  bool selected = false;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final pinController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  DropDownItem? defaultState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = context.read<CountryCubit>();
      var branchCubit = context.read<BranchCubit>();
      if (widget.addBranch) {
        countryId = cubit.defaultCountry?.id;
        districtId = cubit.defaultDistrict?.id;
        stateId = cubit.defaultState?.id;
        defaultState = cubit.defaultState;
      } else {
        selected = branchCubit.branch?.isActive == 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BranchCubit>();
    var countryCubit = context.read<CountryCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonBar(
        title: widget.addBranch ? 'Add Branch' : 'Edit Branch',
      ),
      body: BlocListener<BranchCubit, BranchState>(
        listener: (context, state) {
          if (state is BranchLoaded) {}
          if (state is BranchNetworkError) {
            AlertBox.showErrorAlert(context);
          } else if (state is AddingBranch || state is UpdatingBranch) {
            Loader(context, message: 'Adding Branch ...').show();
          } else if (state is AddingBranchFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          } else if (state is UpdateBranchFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          } else if (state is BranchAdded || state is UpdatedBranch) {
            Navigator.pop(context);
            Navigator.pop(context);
            Alert(context).show(
              message:
                  state is UpdatedBranch ? 'Branch Updated.' : 'Branch added.',
            );
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
            controller: _scrollController,
            children: [
              if (!widget.addBranch)
                const SizedBox(
                  height: 20,
                ),
              if (!widget.addBranch)
                EnableSwitch(
                  enable: cubit.branch?.isActive != 0,
                  onChange: (bool value) {
                    selected = value;
                  },
                ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue:
                    widget.addBranch ? null : cubit.branch?.branchName,
                node: nameFocus,
                length: 40,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                title: 'Enter Branch Name *',
                hint: 'Eg: Main Branch',
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Please enter branch name.'
                      : null;
                },
                onChange: (value) {
                  branchName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue: widget.addBranch ? null : cubit.branch?.address,
                node: addressFocus,
                length: 300,
                verticalPadding: 10,
                title: 'Address *',
                textInputAction: TextInputAction.newline,
                hint: 'Eg: Kowdiar, C-10, Jawahar Nagar \nTrivandrum',
                maxLines: 3,
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Please enter address.'
                      : null;
                },
                onChange: (value) {
                  address = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'Country *',
                validator: (value) {
                  return value == null ? 'Please select country.' : null;
                },
                onChange: (value) {
                  countryId = value.id;
                  countryCubit.getStates(countryId: countryId!);
                },
                defaultItem: widget.addBranch
                    ? countryCubit.defaultCountry
                    : countryCubit.getCountry(cubit.branch?.countryId),
                dropDown: true,
                dropDownItems: countryCubit.countriesForDropDown,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'State *',
                onChange: (value) {
                  stateId = value.id;
                },
                validator: (value) {
                  return value == null ? 'Please select state.' : null;
                },
                hint: 'Select State',
                dropDown: true,
                defaultItem: widget.addBranch
                    ? countryCubit.defaultState
                    : countryCubit.getState(cubit.branch?.stateId),
                dropDownItems: countryCubit.statesForDropDown,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                title: 'District *',
                onChange: (value) {
                  districtId = value.id;
                },
                hint: 'Select District',
                validator: (value) {
                  return value == null ? 'Please select district.' : null;
                },
                dropDown: true,
                defaultItem: widget.addBranch
                    ? countryCubit.defaultDistrict
                    : countryCubit.getDistrict(cubit.branch?.districtId),
                dropDownItems: countryCubit.districtsForDropDown,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
                initialValue:
                    widget.addBranch ? null : '${cubit.branch?.pincode}',
                validator: (value) {
                  return value == null ||
                          value.isEmpty ||
                          value.toString().length < 6
                      ? 'Please enter pin code.'
                      : null;
                },
                node: pinFocus,
                length: 6,
                textInputAction: TextInputAction.done,
                inputType: const TextInputType.numberWithOptions(signed: true),
                title: 'PIN *',
                hint: 'Eg: 695014',
                maxLines: 1,
                phoneField: true,
                onChange: (value) {
                  pinCode = value;
                  if (value.toString().length == 6) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Button(
                  onTap: () {
                    formKey.currentState?.validate();
                    formKey.currentState?.save();
                    if (branchName.trim().isEmpty) {
                      _scrollController.animateTo(
                        nameFocus.offset.dy,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                      nameFocus.requestFocus();
                      return;
                    }
                    if (address.trim().isEmpty) {
                      _scrollController.animateTo(
                        addressFocus.offset.dy,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                      addressFocus.requestFocus();
                      return;
                    }
                    if (pinCode.trim().isEmpty || pinCode.length < 6) {
                      _scrollController.animateTo(
                        pinFocus.offset.dy,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                      pinFocus.requestFocus();
                      return;
                    }
                    if (formKey.currentState!.validate()) {
                      if (widget.addBranch) {
                        cubit.addBranch(
                          stateId: '$stateId',
                          branchName: branchName,
                          countryId: '$countryId',
                          districtId: '$districtId',
                          location: '',
                          address: address,
                          pinCode: pinCode,
                        );
                      } else {
                        cubit.updateBranch(
                          stateId: '$stateId',
                          branchName: branchName,
                          countryId: '$countryId',
                          districtId: '$districtId',
                          location: '',
                          address: address,
                          pinCode: pinCode,
                          isActive: selected ? 1 : 0,
                        );
                      }
                    }
                  },
                  title: 'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
