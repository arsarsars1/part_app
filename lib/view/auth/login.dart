import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/auth/sign_up.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/country/country_cubit.dart';

class Login extends StatefulWidget {
  static const route = '/auth/login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? phoneNo;
  Country? country;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CountryCubit>().getCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                Strings.welcome,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                Strings.loginWelcomeMessage,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            PhoneNumber(
              onCountryChange: (Country value) {
                country = value;
              },
              onNumberChange: (String value) {
                phoneNo = value;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignUp.route);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.notAMember,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    Strings.joinNow,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Button(
              onTap: () {},
              title: Strings.login,
            ),
          ],
        ),
      ),
    );
  }
}
