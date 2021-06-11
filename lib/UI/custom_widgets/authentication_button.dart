import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationButton extends StatelessWidget {
  AuthenticationButton({@required this.onTap, @required this.buttonText});
  final onTap;
  final buttonText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 301.w,
        height: 41.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: global.baseColor,
        ),
        child: Text(
          buttonText,
          style: textStyleAuthenticationButton,
        ),
      ),
    );
  }
}
