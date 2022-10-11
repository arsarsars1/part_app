import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/route_generator.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/cubits.dart';

void main() async {
  await initialize();
  runApp(const App());
}

Future initialize() async {
  await Hive.initFlutter();
  await Database().init();
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
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
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
