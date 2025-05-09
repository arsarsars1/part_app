import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';

class TabButton extends StatefulWidget {
  final ValueChanged<String> onChange;
  final List<String> options;
  final String? selectedOption;

  const TabButton(
      {super.key,
      required this.onChange,
      required this.options,
      this.selectedOption});

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  String selectedIndex = '';

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIConstants.buttonHeight,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          ...widget.options.map(
            (e) => Expanded(
              child: InkWell(
                onTap: () {
                  widget.onChange(e);
                  setState(() {
                    selectedIndex = e;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  decoration: e == (widget.selectedOption ?? selectedIndex)
                      ? BoxDecoration(
                          color: Colors.white.withOpacity(0.28),
                          borderRadius: BorderRadius.circular(5),
                        )
                      : null,
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
