import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/service/api.dart';

class CachedImage {
  final String imageUrl;
  final double? height;
  final BoxFit fit;

  CachedImage(
    this.imageUrl, {
    this.height,
    this.fit = BoxFit.cover,
  });

  DecorationImage getDecorationImage() {
    var token = 'Bearer ${Database().getToken()}';
    return DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
        imageUrl,
        headers: {
          "Authorization": token,
          'MOBILE-APP-TOKEN': ApiClient().token,
        },
      ),
    );
  }

  CachedNetworkImage image() {
    var token = 'Bearer ${Database().getToken()}';
    return CachedNetworkImage(
      height: height,
      imageUrl: imageUrl,
      fit: fit,
      errorWidget: (context, str, _) {
        return CachedImage(
          'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg',
        ).image();
      },
      httpHeaders: {
        "Authorization": token,
        'MOBILE-APP-TOKEN': ApiClient().token,
      },
    );
  }
}
