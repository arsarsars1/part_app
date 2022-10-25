import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.addBranch) {
        var cubit = context.read<CountryCubit>();

        countryId = cubit.defaultCountry?.id;
        districtId = cubit.defaultDistrict?.id;
        stateId = cubit.defaultState?.id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BranchCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonBar(title: 'Add Branch'),
      body: BlocListener<BranchCubit, BranchState>(
        listener: (context, state) {
          if (state is AddingBranch) {
            Loader(context, message: 'Adding Branch ...').show();
          } else if (state is AddingBranchFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          } else if (state is BranchAdded) {
            Navigator.pop(context);
            Alert(context).show(message: 'Branch added.');
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
                node: nameFocus,
                length: 100,
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
                node: addressFocus,
                length: 300,
                title: 'Address *',
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
                  context.read<CountryCubit>().getStates(countryId: countryId!);
                },
                defaultItem: context.read<CountryCubit>().defaultCountry,
                dropDown: true,
                dropDownItems:
                    context.read<CountryCubit>().countriesForDropDown,
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
                defaultItem: context.read<CountryCubit>().defaultState,
                dropDownItems: context.read<CountryCubit>().statesForDropDown,
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
                defaultItem: context.read<CountryCubit>().defaultDistrict,
                dropDownItems:
                    context.read<CountryCubit>().districtsForDropDown,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonField(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 132.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: Button(
                onTap: () {
                  formKey.currentState?.validate();
                  if (branchName.trim().isEmpty) {
                    nameFocus.requestFocus();
                    return;
                  }
                  if (address.trim().isEmpty) {
                    addressFocus.requestFocus();
                    return;
                  }
                  if (pinCode.trim().isEmpty || pinCode.length < 6) {
                    pinFocus.requestFocus();
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    cubit.addBranch(
                      stateId: '$stateId',
                      branchName: branchName,
                      countryId: '$countryId',
                      districtId: '$districtId',
                      location: '',
                      address: address,
                      pinCode: pinCode,
                    );
                  }
                },
                title: 'Save',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
