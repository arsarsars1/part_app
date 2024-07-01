import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({super.key});

  @override
  State<WebsiteView> createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  AuthCubit? authCubit;
  HomeCubit? homeCubit;
  String? shopUrl;
  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    homeCubit = context.read<HomeCubit>();
    checkForUrl();
  }

  checkForUrl() async {
    if (authCubit?.user?.adminDetail?.id != null) {
      shopUrl = await homeCubit?.getShopUrl();
    } else if (authCubit
            ?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id !=
        null) {
      shopUrl = await homeCubit?.getShopUrl(
        trainerId:
            authCubit?.user?.trainerDetail?[authCubit?.trainerIndex ?? 0].id ??
                0,
      );
    } else if (authCubit
            ?.user?.studentDetail?[authCubit?.studentIndex ?? 0].id !=
        null) {
      shopUrl = await homeCubit?.getShopUrl(
        studentId:
            authCubit?.user?.studentDetail?[authCubit?.studentIndex ?? 0].id ??
                0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You can click on the below link and browse in the website',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.center,
              child: Button(
                height: UIConstants.buttonHeight,
                onTap: () {
                  Alert(context).show(message: "Coming soon !!");
                  // final Uri url = Uri.parse(shopUrl ?? '');
                  // _launchUrl(url);
                },
                title: 'Go To Website',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _launchUrl(Uri url) async {
  //   if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
}
