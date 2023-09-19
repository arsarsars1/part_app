import 'package:flutter/material.dart';
import 'package:part_app/view/auth/login/login.dart';
import 'package:part_app/view/components/alert_box.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      context.read<AuthCubit>().validateLocalUser();
      context.read<CountryCubit>().getCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is NetworkError) {
          AlertBox.showErrorAlert(context);
        } else if (state is UserAvailable) {
          if (state.member) {
            cubit.navigateToDashboard(cubit.user?.adminDetail?.academy, cubit.user?.trainerDetail, cubit.user?.studentDetail, context
            );
           
          } else {
            Navigator.pushReplacementNamed(
              context,
              Membership.route,
              // (route) => false,
            );
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Login.route,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'part',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 72,
                    ),
              ),
              TextSpan(
                text: 'app',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 32,
                      color: AppColors.primaryColor,
                    ),
              ),
              TextSpan(
                text: '.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 32,
                    ),
              ),
              TextSpan(
                text: 'in',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 32,
                      color: const Color(0xFF00D053),
                    ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
