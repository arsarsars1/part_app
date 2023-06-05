import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/constants/constant.dart';

class ImagePickerDialog {
  final BuildContext context;
  final bool documents;

  ImagePickerDialog(this.context, {this.documents = false});

  /// Method to open the image picker dialog
  /// [ context ] is required and uses [ ImageType ] to determine the image
  /// picker type
  void open({
    required ValueChanged<File> onSelect,
  }) async {
    final ImagePicker picker = ImagePicker();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: _PickerList(
            documents: documents,
            onSelect: (ImageType value) async {
              Navigator.pop(context);
              switch (value) {
                case ImageType.camera:
                  // Capture a photo using camera
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (photo?.path != null) {
                    onSelect(File(photo!.path));
                  }
                  break;
                case ImageType.gallery:
                  // Choose a photo from device
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (photo?.path != null) {
                    onSelect(File(photo!.path));
                  }
                  break;
                case ImageType.avatar:
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      content: Container(
                        decoration: BoxDecoration(
                          color: AppColors.liteDark,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Choose an avatar',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 18.sm, color: Colors.white70),
                              ),
                            ),
                            const Divider(
                              color: Colors.white70,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-1.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-1.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-2.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-2.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-3.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-3.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-4.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-4.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-5.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-5.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-6.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-6.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-7.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-7.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-8.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-8.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-9.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-9.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-10.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-10.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-11.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-11.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        File file =
                                            await getImageFileFromAssets(
                                                'avatar-12.png');
                                        onSelect(file);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/avatar-12.png',
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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
  final bool documents;

  const _PickerList({Key? key, required this.onSelect, required this.documents})
      : super(key: key);

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
              documents ? 'Upload ID Proof' : 'Change Profile Picture',
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
          if (!documents)
            InkWell(
              onTap: () {
                onSelect(ImageType.avatar);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
