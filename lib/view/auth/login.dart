import 'package:flutter/material.dart';
import 'package:part_app/view/auth/components/phone_number.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/constant.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
            const PhoneNumber(),
            const SizedBox(
              height: 32,
            ),
            Row(
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
