import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/membership/salesman_otp.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

class SalesManPhone extends StatefulWidget {
  static const route = '/membership/salesman';

  const SalesManPhone({Key? key}) : super(key: key);

  @override
  State<SalesManPhone> createState() => _SalesManPhoneState();
}

class _SalesManPhoneState extends State<SalesManPhone> {
  String phoneNo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Enter Salesman Phone number to get payment code for in-hand payments ',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                CommonField(
                  phoneField: true,
                  inputType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  title: 'Enter Salesman Phone Number *',
                  hint: 'Eg: +91 **********',
                  onChange: (value) {
                    phoneNo = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Button(
                onTap: () {
                  if (phoneNo.isNotEmpty) {
                    context.read<MembershipCubit>().sendOTP(phoneNo: phoneNo);
                    Navigator.pushNamed(context, SalesManOTP.route);
                  }
                },
                title: 'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
