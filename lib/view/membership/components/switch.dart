import 'package:flutter/material.dart';
import 'package:part_app/view/constants/app_colors.dart';

class MembershipSwitch extends StatefulWidget {
  final ValueChanged<bool> onSelect;

  const MembershipSwitch({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<MembershipSwitch> createState() => _MembershipSwitchState();
}

class _MembershipSwitchState extends State<MembershipSwitch> {
  bool free = true;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                free = true;
              });
              widget.onSelect(free);
            },
            child: Container(
              decoration: BoxDecoration(
                color: free ? Colors.white : null,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 100,
              height: 36,
              child: Center(
                child: Text(
                  'Free',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: free ? Colors.black : Colors.white,
                      ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                free = false;
              });
              widget.onSelect(free);
            },
            child: Container(
              decoration: BoxDecoration(
                color: free ? null : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 100,
              height: 36,
              child: Center(
                child: Text(
                  'Paid',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
