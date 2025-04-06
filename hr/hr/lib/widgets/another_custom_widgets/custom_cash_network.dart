import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCashNetwork extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CustomCashNetwork({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Colors.red,
        size: width / 3, // Adjust the size of the error icon based on the width
      ),
    );
  }
}
