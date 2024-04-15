import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({Key? key}) : super(key: key);

  @override
  State<WebsiteView> createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
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
                height: 40.h,
                onTap: () {
                  final Uri url = Uri.parse('https://flutter.dev');
                  _launchUrl(url);
                },
                title: 'Go To Website',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
