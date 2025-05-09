import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/logo.dart';

class CommonBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLogo;
  final bool enableBack;
  final dynamic result;
  final VoidCallback? onPressed;

  final List<Widget> actions;

  const CommonBar({
    super.key,
    this.showLogo = false,
    required this.title,
    this.enableBack = false,
    this.onPressed,
    this.result,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            if (enableBack || Navigator.canPop(context))
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: onPressed ??
                      () {
                        Navigator.pop(context, result);
                      },
                  icon: SvgPicture.asset(
                    Assets.back,
                    width: 30,
                    height: 30,
                  ),
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
            if (enableBack || Navigator.canPop(context))
              const SizedBox(
                width: 48,
              ),
            if (actions.isNotEmpty) ...actions,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
