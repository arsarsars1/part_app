import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/service/api.dart';

class CachedImage {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;

  CachedImage(
    this.imageUrl, {
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  var token = 'Bearer ${Database().getToken()}';

  String removeVersionParameter(String url) {
    if (url.endsWith('?v=1')) {
      return url.substring(0, url.length - 4);
    }
    return url;
  }

  DecorationImage getDecorationImage() {
    String cleanUrl = removeVersionParameter(imageUrl);
    return DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
        cleanUrl,
        headers: {
          "Authorization": token,
          'MOBILE-APP-TOKEN': ApiClient().token,
        },
      ),
    );
  }

  CachedNetworkImage image() {
    String cleanUrl = removeVersionParameter(imageUrl);
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: cleanUrl,
      cacheKey: cleanUrl,
      fit: fit,
      errorWidget: (context, str, _) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: SvgPicture.asset(
            Assets.trainerListIcon,
          ),
        );
      },
      httpHeaders: {
        "Authorization": token,
        'MOBILE-APP-TOKEN': ApiClient().token,
      },
    );
  }

  CachedNetworkImage userImage() {
    String cleanUrl = removeVersionParameter(imageUrl);
    return CachedNetworkImage(
      height: height,
      width: width,
      cacheKey: cleanUrl,
      imageUrl: cleanUrl,
      fit: fit,
      errorWidget: (context, str, _) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: SvgPicture.asset(
            Assets.trainerListIcon,
          ),
        );
      },
      httpHeaders: {
        "Authorization": token,
        'MOBILE-APP-TOKEN': ApiClient().token,
      },
    );
  }
}
