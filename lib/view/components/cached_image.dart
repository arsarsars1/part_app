import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/service/api.dart';

class CachedImage {
  final String imageUrl;

  CachedImage(this.imageUrl);

  DecorationImage getDecorationImage() {
    var token = 'Bearer ${Database().getToken()}';
    return DecorationImage(
      fit: BoxFit.cover,
      image: CachedNetworkImageProvider(
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
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (context, str, _) {
        return CachedImage(
          'https://png.pngitem.com/pimgs/s/508-5087236_tab-profile-f-user-icon-white-fill-hd.png',
        ).image();
      },
      httpHeaders: {
        "Authorization": token,
        'MOBILE-APP-TOKEN': ApiClient().token,
      },
    );
  }
}
