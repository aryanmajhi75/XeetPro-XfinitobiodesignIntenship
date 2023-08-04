import 'dart:io';

import 'package:flutter/material.dart';

import 'footgrid.dart';

class showImage extends StatefulWidget {
  const showImage({super.key, required this.imageName});
  final String imageName;
  @override
  State<showImage> createState() => _showImageState();
}

class _showImageState extends State<showImage> {
  @override
  void initState() {
    super.initState();
    print("inside showImage : ${widget.imageName} ");
  }

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(
        widget.imageName,
      ), //if image list is not empty show the clicked image
      fit: BoxFit.fill,
    );
  }
}
