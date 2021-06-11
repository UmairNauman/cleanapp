import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';

class DescripionTextfeild extends StatelessWidget {
  DescripionTextfeild({@required this.onChanged});

  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        cursorColor: global.baseColor,
        scrollPadding: EdgeInsets.all(10),
        maxLines: 3,
        style: textStyleDecsriptionText,
        decoration: InputDecoration(
            hintText:
                'Quiere la boca exhausta vid, kiwi, piña y fugaz jamón. Fabio me exige, sin tapujos, que añada cerveza al whisky. Jovencillo emponzoñado de whisky, ¡qué figurota exhibes! La cigüeña.',
            hintStyle: textStyleDecsriptionText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: global.lableColor, width: 0.0),
            ),
            labelStyle: textStyleLable,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 5.w,
                  color: global.lableColor,
                ))));
  }
}
