import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/cached_image.dart';

class UserImage extends StatelessWidget {
  final String? profilePic;

  const UserImage({Key? key, this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0575E6),
            Color(0xFF640078),
          ],
        ),
      ),
      padding: EdgeInsets.all(9.r),
      child: CachedImage(
        profilePic!,
      ).userImage(),
    );
  }
}
