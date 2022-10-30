import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/constants/constant.dart';

class ProfilePicture extends StatelessWidget {
  final VoidCallback onEdit;
  const ProfilePicture({Key? key, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/552/552721.png',
          ),
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/552/552721.png',
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onEdit,
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
                child: const Icon(
                  Icons.edit_outlined,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
