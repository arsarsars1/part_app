import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/service/api.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/route_generator.dart';
import 'package:part_app/view/splash.dart';
import 'package:part_app/view_model/cubits.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Stream<int>? stream;

  @override
  void initState() {
    stream = ApiClient().controller?.stream;
    // stream?.listen((event) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (context) => CountryCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit()..init401Listener(),
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
        BlocProvider<ManagerCubit>(
          create: (context) => ManagerCubit(),
        ),
        BlocProvider<BatchCubit>(
          create: (context) => BatchCubit(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
      ),
    );
  }
}
