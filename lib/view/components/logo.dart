import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'part',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 42.sm,
                ),
          ),
          TextSpan(
            text: 'app.in',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 20.sm,
                ),
          ),
        ],
      ),
    );
  }
}
