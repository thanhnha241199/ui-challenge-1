import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final bool isBorderRadius;

  const CachedImage(
      {Key key,
      this.width = 36.0,
      this.height = 36.0,
      this.imageUrl =
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      this.isBorderRadius = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(isBorderRadius ? width / 2 : 0)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
