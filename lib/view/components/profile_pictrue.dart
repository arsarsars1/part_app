import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/image_picker.dart';
import 'package:part_app/view/constants/constant.dart';

class ProfilePicture extends StatefulWidget {
  final VoidCallback onEdit;
  final ValueChanged<File> onChange;
  final String? imageUrl;

  const ProfilePicture({
    Key? key,
    required this.onEdit,
    required this.onChange,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.w,
      constraints: BoxConstraints(maxWidth: 70.w),
      decoration: BoxDecoration(
        image: file == null
            ? null
            : DecorationImage(
                image: FileImage(file!),
                fit: BoxFit.cover,
              ),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          if (file == null)
            Image.network(
              widget.imageUrl == null
                  ? 'https://cdn-icons-png.flaticon.com/512/552/552721.png'
                  : widget.imageUrl!,
              color: Colors.white,
              errorBuilder: (context, object, error) {
                return Image.network(
                  'https://cdn-icons-png.flaticon.com/512/552/552721.png',
                  color: Colors.white,
                );
              },
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
        ],
      ),
    );
  }
}
