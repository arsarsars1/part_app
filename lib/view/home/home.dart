import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/home/components/dashboard_icons.dart';
import 'package:part_app/view/home/components/home_banner.dart';
import 'package:part_app/view/home/components/home_bar.dart';
import 'package:part_app/view_model/cubits.dart';

class Home extends StatefulWidget {
  static const route = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomeBar(),
            ),
            Expanded(
              child: ListView(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  HomeBanner(),
                  SizedBox(
                    height: 10,
                  ),
                  DashboardIcons()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
