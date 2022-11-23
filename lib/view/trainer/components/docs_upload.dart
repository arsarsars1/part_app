import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/view/components/document_image.dart';
import 'package:part_app/view/components/image_picker.dart';
import 'package:part_app/view/constants/constant.dart';

class DocsUpload extends StatefulWidget {
  final ValueChanged<File?> doc1;
  final ValueChanged<File?> doc2;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final String? document1;
  final String? document2;

  const DocsUpload({
    Key? key,
    required this.doc1,
    required this.doc2,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.document1,
    this.document2,
  }) : super(key: key);

  @override
  State<DocsUpload> createState() => _DocsUploadState();
}

class _DocsUploadState extends State<DocsUpload> {
  File? document1;
  File? document2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          widget.crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        const Text(
          'ID Proof Images Upload Max Of 2 Nos.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ImagePickerDialog(context, documents: true).open(
                    onSelect: (File value) {
                  setState(() {
                    document1 = value;
                  });
                  widget.doc1(document1);
                  widget.doc2(document2);
                });
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
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
                  if (document1 == null && widget.document1 != null)
                    DocumentImage(
                      imageUrl: widget.document1,
                    ),
                  if (document1 != null || widget.document1 != null)
                    Container(
                      height: 24,
                      width: 24,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                ],
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
                  widget.doc1(document1);
                  widget.doc2(document2);
                });
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
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
                  if (document2 == null && widget.document2 != null)
                    DocumentImage(
                      imageUrl: widget.document2,
                    ),
                  if (document2 != null || widget.document2 != null)
                    Container(
                      height: 24,
                      width: 24,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.liteDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
