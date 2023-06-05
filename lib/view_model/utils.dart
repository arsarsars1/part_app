import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Utils {
  Future<MultipartFile?> generateMultiPartFile(File file) async {
    try {
      var list = await FlutterImageCompress.compressWithFile(
        file.path,
        quality: 75,
        keepExif: false,
        minHeight: 640,
        minWidth: 480,
      );
      if (list != null) {
        MultipartFile multipartFile =
            MultipartFile.fromBytes(list, filename: basename(file.path));

        return multipartFile;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
