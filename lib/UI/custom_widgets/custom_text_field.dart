import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final validator;
  final lableText;
  final onIconPressed;
  final onChanged;
  final isPassword;
  final isObscureText;
  final controller;

  CustomTextField({
    this.controller,
    @required this.lableText,
    this.onIconPressed,
    @required this.validator,
    @required this.onChanged,
    this.isPassword = false,
    this.isObscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      // width: 301.w,
      child: TextFormField(
        controller: this.controller,
        onChanged: onChanged,
        validator: validator,
        cursorColor: global.baseColor,
        obscureText: isObscureText,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 9.7, height: 0.06),
          suffixIcon: isPassword
              ? IconButton(
                  color: global.baseColor,
                  icon: isObscureText
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off),
                  onPressed: onIconPressed ?? () {},
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: global.lableColor, width: 0.0),
          ),
          hintText: lableText,
          hintStyle: textStyleLable,
          labelText: lableText,
          labelStyle: textStyleLable,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 5.w,
              color: global.lableColor,
            ),
          ),
        ),
      ),
    );
  }
}
