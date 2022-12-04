import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class SessionAlert {
  static final SessionAlert _sessionAlert = SessionAlert._internal();

  factory SessionAlert() {
    return _sessionAlert;
  }

  SessionAlert._internal();

  /// variables

  bool _alertShown = false;

  void show(BuildContext context) {
    if (!_alertShown) {
      _alertShown = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.liteDark,
          content: _SessionDialog(
            onTap: () {
              _alertShown = false;
              Navigator.pop(context);
              context.read<AuthCubit>().logout();
            },
          ),
        ),
      );
    }
  }
}

class _SessionDialog extends StatelessWidget {
  final VoidCallback onTap;

  const _SessionDialog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.liteDark,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Session Expired, Please login again.',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(),
          ),
          const SizedBox(
            height: 16,
          ),
          Button(
            height: 30,
            onTap: onTap,
            title: 'Login',
          ),
        ],
      ),
    );
  }
}
