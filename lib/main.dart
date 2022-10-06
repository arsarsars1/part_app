import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/route_generator.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (context) => CountryCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<MembershipCubit>(
          create: (context) => MembershipCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          designSize: const Size(800, 360),
          builder: (_, child) {
            return MaterialApp(
              title: 'Part App',
              theme: AppTheme.lightTheme,
              home: const SplashScreen(),
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
