import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/country/country_cubit.dart';

class PhoneNumber extends StatelessWidget {
  final ValueChanged<Country> onCountryChange;
  final ValueChanged<String> onNumberChange;

  const PhoneNumber(
      {super.key, required this.onCountryChange, required this.onNumberChange});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CountryCubit>();
    return BlocBuilder<CountryCubit, CountryState>(
      buildWhen: (prv, crr) => crr is CountriesLoaded,
      builder: (context, state) {
        if (cubit.defaultCountry != null) {
          onCountryChange(cubit.defaultCountry?.item);
        }

        return Column(
          children: [
            CommonField(
              title: Strings.country,
              dropDown: true,
              dropDownItems: cubit.countriesForDropDown,
              defaultItem: cubit.defaultCountry,
              onChange: (value) {
                onCountryChange(value.item);
              },
              validator: (value) {
                return value == null ? 'Please select the Country.' : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              length: 10,
              phoneField: true,
              inputType: TextInputType.phone,
              title: Strings.enterPhoneNo,
              hint: 'Eg: 9876543210',
              onChange: (value) {
                onNumberChange(value);
              },
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return 'Please enter number.';
                } else if (value.toString().length < 10) {
                  return 'Invalid phone number.';
                }

                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
