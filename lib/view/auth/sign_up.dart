import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class SignUp extends StatelessWidget {
  static const route = '/auth/signUp';

  const SignUp({Key? key}) : super(key: key);

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  Strings.signUpWelcomeMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            PhoneNumber(
              onCountryChange: (Country value) {},
              onNumberChange: (String value) {},
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.alreadyMember,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
                Text(
                  Strings.login,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                )
              ],
            ),
            const SizedBox(
              height: 64,
            ),
            Button(
              onTap: () {},
              title: Strings.continueLabel,
            ),
          ],
        ),
      ),
    );
  }
}
