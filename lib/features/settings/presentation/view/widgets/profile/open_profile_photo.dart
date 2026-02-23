import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OpenProfilePhoto extends StatelessWidget {
  final String url;
  const OpenProfilePhoto({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: CachedNetworkImage(
            imageUrl: url,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
