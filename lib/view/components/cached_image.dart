import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/service/api.dart';

class CachedImage {
  final String imageUrl;

  CachedImage(this.imageUrl);

  DecorationImage getImage() {
    var token = 'Bearer ${Database().getToken()}';
    return DecorationImage(
      image: CachedNetworkImageProvider(
        imageUrl,
        headers: {
          "Authorization": token,
          'MOBILE-APP-TOKEN': ApiClient().token,
        },
      ),
    );
  }
}
