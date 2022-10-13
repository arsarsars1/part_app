import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/view/components/logo.dart';
import 'package:part_app/view/constants/assets.dart';

class CommonBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hideBack;
  final String title;
  final bool showLogo;

  const CommonBar(
      {Key? key,
      this.showLogo = false,
      this.hideBack = false,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            if (Navigator.canPop(context))
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(Assets.back),
                ),
              ),
            if (!showLogo) const Spacer(),
            if (!showLogo)
              Text(
                title,
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            if (showLogo)
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Logo(),
              ),
            const Spacer(),
            const SizedBox(
              width: 48,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
