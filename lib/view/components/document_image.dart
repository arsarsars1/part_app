import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/cached_image.dart';

class DocumentImage extends StatefulWidget {
  final String? imageUrl;

  const DocumentImage({Key? key, this.imageUrl}) : super(key: key);

  @override
  State<DocumentImage> createState() => _DocumentImageState();
}

class _DocumentImageState extends State<DocumentImage> {
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
                content: CachedImage(
                  widget.imageUrl!,
                  height: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.contain,
                ).image(),
              );
            });
      },
      child: Container(
        height: 77.h,
        width: 93.w,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(5),
          image: widget.imageUrl != null
              ? CachedImage(
                  widget.imageUrl!,
                ).getDecorationImage()
              : null,
        ),
      ),
    );
  }
}
