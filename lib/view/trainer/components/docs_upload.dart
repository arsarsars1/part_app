import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/view/components/image_picker.dart';
import 'package:part_app/view/constants/constant.dart';

class DocsUpload extends StatefulWidget {
  final ValueChanged<List<File>> documents;

  const DocsUpload({Key? key, required this.documents}) : super(key: key);

  @override
  State<DocsUpload> createState() => _DocsUploadState();
}

class _DocsUploadState extends State<DocsUpload> {
  File? document1;
  File? document2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'ID Proof Images Upload Max Of 2 Nos.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ImagePickerDialog(context, documents: true).open(
                    onSelect: (File value) {
                  setState(() {
                    document1 = value;
                  });
                });
              },
              child: Container(
                height: 77.h,
                width: 93.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                  image: document1 != null
                      ? DecorationImage(image: FileImage(document1!))
                      : null,
                ),
                child: document1 != null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: SvgPicture.asset(Assets.fileUpload),
                      ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            InkWell(
              onTap: () {
                ImagePickerDialog(context, documents: true).open(
                    onSelect: (File value) {
                  setState(() {
                    document2 = value;
                  });
                });
              },
              child: Container(
                height: 77.h,
                width: 93.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(5),
                  image: document2 != null
                      ? DecorationImage(image: FileImage(document2!))
                      : null,
                ),
                child: document2 != null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: SvgPicture.asset(Assets.fileUpload),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
