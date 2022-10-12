import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/auth/register/admin_details.dart';
import 'package:part_app/view/components/common_bar.dart';
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
      appBar: const CommonBar(
        title: 'Academy Admin Details',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonField(
            fillColor: AppColors.disabledColor,
            disabled: true,
            textColor: Colors.black,
            title: 'Your Phone Number *',
            length: 10,
            onChange: (value) {},
            initialValue: context.read<AuthCubit>().phoneNumber,
            suffixIcon: const Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Is The Above Number Your Whatsapp Number ?',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
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
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          if (!selected)
            CommonField(
              inputType: TextInputType.phone,
              title: 'Whatsapp Phone Number *',
              onChange: (value) {
                waNumber = value;
              },
              length: 10,
              hint: 'Eg: 9876543210',
            ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 136.h,
        child: BottomAppBar(
          color: Colors.black,
          child: Center(
            child: Button(
              onTap: () {
                if (!selected && (waNumber == null || waNumber!.length < 10)) {
                  Alert(context).show(
                    message: 'Please Enter Your Whatsapp Number!',
                  );
                  return;
                }
                if (!selected && (waNumber != null && waNumber!.length == 10)) {
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
      ),
    );
  }
}
