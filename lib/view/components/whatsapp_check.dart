import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';

class WhatsappCheckButton extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final ValueChanged<String> onNumberChange;
  final String? initialValue;
  final bool selected;
  final bool isMandatory;

  const WhatsappCheckButton({
    super.key,
    required this.onChange,
    required this.onNumberChange,
    this.initialValue,
    this.selected = false,
    this.isMandatory = true,
  });

  @override
  State<WhatsappCheckButton> createState() => _WhatsappCheckButtonState();
}

class _WhatsappCheckButtonState extends State<WhatsappCheckButton> {
  bool selected = true;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Is The Above Number Your Whatsapp Number?',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 25.0,
                padding: const EdgeInsets.only(right: 16),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CupertinoSwitch(
                    trackColor: AppColors.grey500,
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = !selected;
                      });
                      widget.onChange(selected);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        if (!selected)
          const SizedBox(
            height: 20,
          ),
        selected
            ? const Offstage()
            : CommonField(
                phoneField: true,
                initialValue: widget.initialValue,
                validator: widget.isMandatory
                    ? (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Please enter Whatsapp number.';
                        } else if (value.toString().length < 10) {
                          return 'Invalid Whatsapp number.';
                        }
                        return null;
                      }
                    : null,
                inputType: TextInputType.phone,
                title: 'Whatsapp Phone Number ${widget.isMandatory ? '*' : ""}',
                onChange: (value) {
                  widget.onNumberChange(value);
                  if (value.length >= 10) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                length: 10,
                hint: 'Eg: 9876543210',
              ),
      ],
    );
  }
}
