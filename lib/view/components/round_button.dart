import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final bool edit;
  final VoidCallback onTap;

  const RoundButton({Key? key, this.edit = true, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Icon(
          edit ? Icons.edit_outlined : Icons.close,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
