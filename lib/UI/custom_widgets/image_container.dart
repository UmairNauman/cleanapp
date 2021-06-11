import 'package:flutter/material.dart';

class DotContainer extends StatelessWidget {
  final assetsImages;
  final h;
  final w;

  DotContainer(
      {@required this.assetsImages, @required this.h, @required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      child: Image.asset(assetsImages),
    );
  }
}
