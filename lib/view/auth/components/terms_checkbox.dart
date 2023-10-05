import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChange;
  const TermsCheckBox({Key? key, required this.onChange}) : super(key: key);

  @override
  State<TermsCheckBox> createState() => _TermsCheckBoxState();
}

class _TermsCheckBoxState extends State<TermsCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all(const Color(0xFF818181)),
          // checkColor: AppColors.primaryColor,
          value: checked,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                checked = value;
              });
              widget.onChange(value);
            }
          },
        ),
        Expanded(
          child: RichText(
            maxLines: 2,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By clicking, I Accept The ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                ),
                TextSpan(
                  text: 'Terms & Conditions ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse('https://www.partapp.in/privacy-policy.html'),
                      );
                    },
                ),
                TextSpan(
                  text: 'And ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                ),
                TextSpan(
                  text: '\nPrivacy Policy',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse('https://www.partapp.in/privacy-policy.html'),
                      );
                    },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
