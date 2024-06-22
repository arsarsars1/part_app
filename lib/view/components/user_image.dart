import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:part_app/view/components/cached_image.dart';

import '../../constants/assets.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: profilePic != ""
            ? CachedImage(profilePic ?? "").userImage()
            : Padding(
                padding: const EdgeInsets.all(9.0),
                child: SvgPicture.asset(
                  Assets.trainerListIcon,
                ),
              ),
      ),
    );
  }
}
