import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/membership/subscription_success.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/country/country_cubit.dart';

class AddBranchRegister extends StatefulWidget {
  static const route = '/auth/branch-details';

  const AddBranchRegister({Key? key}) : super(key: key);

  @override
  State<AddBranchRegister> createState() => _AddBranchRegisterState();
}

class _AddBranchRegisterState extends State<AddBranchRegister> {
  String branchName = '';
  String address = '';
  int? countryId;
  int? stateId;
  int? districtId;
  String pinCode = '';

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cubit = context.read<CountryCubit>();

      countryId = cubit.defaultCountry?.id;
      districtId = cubit.defaultDistrict?.id;
      stateId = cubit.defaultState?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonBar(
        title: 'Branch Details',
      ),
      body: Form(
        key: formKey,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisteringUser) {
              Loader(
                context,
                message: 'Please wait while we create your account.',
              ).show();
            }
            if (state is RegisterFailed) {
              Navigator.pop(context);
              Alert(context).show(message: state.message);
            } else if (state is RegisterSuccess) {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                SubscriptionSuccess.route,
                arguments: true,
                (route) => false,
              );
            }
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CommonField(
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
                length: 300,
                textInputAction: TextInputAction.newline,
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
                length: 6,
                textInputAction: TextInputAction.done,
                inputType: TextInputType.number,
                title: 'PIN *',
                hint: 'Eg: 695014',
                maxLines: 1,
                onChange: (value) {
                  pinCode = value;
                  if (value.length == 6) {
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
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().branchDetails(
                          pinCode: pinCode,
                          branchName: branchName,
                          address: address,
                          countryId: countryId!,
                          districtId: districtId!,
                          stateId: stateId!,
                        );
                  }
                },
                title: 'Sign Up',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
