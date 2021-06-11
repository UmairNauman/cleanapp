import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:flutter/material.dart';

class UploadContainer extends StatelessWidget {
  UploadContainer({@required this.icon, @required this.onTap});
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 305.h,
        width: 356.w,
        color: global.uploadCnntainerColor,
        child: Center(
          child: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                size: 50,
                color: Colors.grey,
              )),
        ));
  }
}
