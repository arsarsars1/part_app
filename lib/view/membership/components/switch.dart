import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/app_colors.dart';

class MembershipSwitch extends StatefulWidget {
  final ValueChanged<bool> onSelect;

  const MembershipSwitch({super.key, required this.onSelect});

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
        border: Border.all(
            color: free ? Colors.white : AppColors.primaryColor, width: 1),
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
              width: 100.w,
              height: 36.h,
              child: Center(
                child: Text(
                  'Free',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
              width: 100.w,
              height: 36.h,
              child: Center(
                child: Text(
                  'Paid',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
