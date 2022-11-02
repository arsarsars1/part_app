import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/route_generator.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/branch/branch_cubit.dart';
import 'package:part_app/view_model/cubits.dart';

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
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<PaymentCubit>(
          create: (context) => PaymentCubit(
            membershipCubit: context.read<MembershipCubit>(),
          ),
        ),
        BlocProvider<BranchCubit>(
          create: (context) => BranchCubit(),
        ),
        BlocProvider<TrainerCubit>(
          create: (context) => TrainerCubit(),
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          child: const SplashScreen(),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: F.title,
              theme: AppTheme.lightTheme,
              home: child,
              builder: (context, widget) {
                return MediaQuery(
                  ///Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
