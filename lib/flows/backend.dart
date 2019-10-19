import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Backend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ),
        imageProvider: AssetImage("assets/images/Roadmaps/Backend.png"),
      ),
    );
  }
}
