import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

class WAValidation extends StatefulWidget {
  static const route = '/auth/wa-validation';

  const WAValidation({Key? key}) : super(key: key);

  @override
  State<WAValidation> createState() => _WAValidationState();
}

class _WAValidationState extends State<WAValidation> {
  bool selected = false;
  String? waNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy Admin Details'),
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
                  fillColor: AppColors.disabledColor,
                  disabled: true,
                  textColor: Colors.black,
                  title: 'Your Phone Number *',
                  onChange: (value) {},
                  initialValue: context.read<AuthCubit>().phoneNumber,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Is the above number your whatsapp number ?',
                        //
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 25.0,
                      padding: const EdgeInsets.only(right: 16),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CupertinoSwitch(
                          trackColor: AppColors.grey500,
                          value: selected,
                          onChanged: (value) {
                            setState(() {
                              selected = !selected;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!selected)
                  CommonField(
                    title: 'Whatsapp Phone Number *',
                    onChange: (value) {
                      waNumber = value;
                    },
                    hint: 'Eg: 9876543210',
                  ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Button(
                onTap: () {
                  if (!selected &&
                      (waNumber != null && waNumber!.length == 10)) {
                    Navigator.pushNamed(context, AdminDetails.route);
                    context.read<AuthCubit>().updateWANumber(waNumber);
                  } else if (selected) {
                    Navigator.pushNamed(context, AdminDetails.route);
                    context.read<AuthCubit>().updateWANumber(null);
                  }
                },
                title: 'Continue',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
