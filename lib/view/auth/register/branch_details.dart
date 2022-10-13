import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/country/country_cubit.dart';

class BranchDetails extends StatefulWidget {
  static const route = '/auth/branch-details';

  const BranchDetails({Key? key}) : super(key: key);

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  String branchName = '';
  String address = '';
  int? countryId;
  int? stateId;
  int? districtId;

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
      resizeToAvoidBottomInset: false,
      appBar: const CommonBar(
        title: 'Branch Details',
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisteringUser) {
            Loader(context,
                    message: 'Please wait while we create your account!')
                .show();
          }
          if (state is RegisterFailed) {
            Navigator.pop(context);
            Alert(context).show(message: state.message);
          } else if (state is RegisterSuccess) {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Membership.route,
              (route) => false,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonField(
              length: 100,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              title: 'Enter Branch Name *',
              hint: 'Eg: Main Branch',
              onChange: (value) {
                branchName = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              length: 300,
              title: 'Address *',
              hint: 'Eg: Kowdiar, C-10, Jawahar Nagar \nTrivandrum, 695010',
              maxLines: 3,
              onChange: (value) {
                address = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Country *',
              onChange: (value) {
                countryId = value.id;
                context.read<CountryCubit>().getStates(countryId: countryId!);
              },
              defaultItem: context.read<CountryCubit>().defaultCountry,
              dropDown: true,
              dropDownItems: context.read<CountryCubit>().countriesForDropDown,
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'State *',
              onChange: (value) {
                stateId = value.id;
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
              dropDown: true,
              defaultItem: context.read<CountryCubit>().defaultDistrict,
              dropDownItems: context.read<CountryCubit>().districtsForDropDown,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (branchName.isEmpty ||
                    address.isEmpty ||
                    countryId == null ||
                    stateId == null ||
                    districtId == null) {
                  Alert(context).show(message: 'Error invalid input!');
                  return;
                }
                context.read<AuthCubit>().branchDetails(
                      branchName: branchName,
                      address: address,
                      countryId: countryId!,
                      districtId: districtId!,
                      stateId: stateId!,
                    );
              },
              title: 'Sign Up',
            ),
          ),
        ),
      ),
    );
  }
}
