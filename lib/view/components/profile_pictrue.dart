import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:part_app/view/constants/constant.dart';

class ProfilePicture extends StatelessWidget {
  final VoidCallback onEdit;
  final ValueChanged<File> onChange;

  const ProfilePicture({
    Key? key,
    required this.onEdit,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.w,
      constraints: BoxConstraints(maxWidth: 70.w),
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
              onTap: () {
                openImagePicker(context);
              },
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

  void openImagePicker(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: _PickerList(
            onSelect: (ImageType value) async {
              Navigator.pop(context);
              switch (value) {
                case ImageType.camera:
                  // Capture a photo
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (photo?.path != null) {
                    onChange(File(photo!.path));
                  }
                  break;
                case ImageType.gallery:
                  // Capture a photo
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (photo?.path != null) {
                    onChange(File(photo!.path));
                  }
                  break;
                case ImageType.avatar:
                  break;
              }
            },
          ),
        );
      },
    );
  }
}

enum ImageType { camera, gallery, avatar }

class _PickerList extends StatelessWidget {
  final ValueChanged<ImageType> onSelect;

  const _PickerList({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.liteDark,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Change Profile Picture',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 18.sm, color: Colors.white70),
            ),
          ),
          const Divider(
            color: Colors.white70,
          ),
          InkWell(
            onTap: () {
              onSelect(ImageType.camera);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white70,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Take Photo',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onSelect(ImageType.gallery);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    color: Colors.white70,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Choose From Phone',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SvgPicture.asset(Assets.avatar),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Choose Avatar Profile Picture',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
