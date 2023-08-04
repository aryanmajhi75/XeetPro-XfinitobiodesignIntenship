import 'dart:io';

import "package:flutter/material.dart";
import 'package:some/new/widgets/footgrid.dart';

class showImageSummary extends StatefulWidget {
  const showImageSummary({super.key});

  @override
  State<showImageSummary> createState() => _showImageSummaryState();
}

class _showImageSummaryState extends State<showImageSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          padding: const EdgeInsets.all(5),
          shrinkWrap: true,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(0),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(1),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(2),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(3),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(4),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(5),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(6),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(7),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(8),
                ),
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(
                  imageList.elementAt(9),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ],
        )
      ],
    );
  }
}
