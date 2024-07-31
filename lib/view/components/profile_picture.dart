import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/cached_image.dart';
import 'package:part_app/view/components/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  final VoidCallback onEdit;
  final ValueChanged<File> onChange;
  final ValueChanged<File> onAvatar;
  final String? imageUrl;

  const ProfilePicture({
    super.key,
    required this.onEdit,
    required this.onChange,
    required this.onAvatar,
    this.imageUrl,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.imageUrl == null) {
          return;
        }
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: InteractiveViewer(
                  panEnabled: false,
                  maxScale: 2,
                  child: CachedImage(
                    widget.imageUrl!,
                    height: MediaQuery.of(context).size.width * 0.75,
                  ).image(),
                ),
              );
            });
      },
      child: Container(
        width: 70.w,
        height: 70.w,
        constraints: BoxConstraints(maxWidth: 70.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: file == null
                ? CachedImage(
                    widget.imageUrl!,
                    height: MediaQuery.of(context).size.width * 0.75,
                  ).image()
                : Image.file(file!),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                ImagePickerDialog(context).open(onSelect: (File value) {
                  setState(() {
                    file = value;
                  });
                  widget.onChange(file!);
                });
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
        ]),
      ),
    );
  }
}
