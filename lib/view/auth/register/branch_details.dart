import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/auth/register/acadmey_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/default_values.dart';
import 'package:part_app/view_model/country/country_cubit.dart';

class BranchDetails extends StatefulWidget {
  static const route = '/auth/branch-details';

  const BranchDetails({Key? key}) : super(key: key);

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch Details'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonField(
                  title: 'Enter Branch Name *',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Address *',
                  maxLines: 4,
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'Country *',
                  onChange: (value) {},
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
                  onChange: (value) {},
                  hint: 'Select State',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonField(
                  title: 'District *',
                  onChange: (value) {},
                  hint: 'Select District',
                  dropDown: true,
                  dropDownItems: DefaultValues().genders,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Button(
                onTap: () {
                  Navigator.pushNamed(context, AcademyDetails.route);
                },
                title: 'Sign Up',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
