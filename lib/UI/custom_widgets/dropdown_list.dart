import 'package:cleanapp/UI/screens/upload_screen/upload_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final onChange;
  final UploadScreenViewModel? model;
  DropDownList({this.onChange, this.model});
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderLineColor),
          borderRadius: BorderRadius.circular(6)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text('      ${widget.model!.dropDownValue}',
                  style: textStyleAuthenticationText),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: blackColor),
          style: textStyleAuthenticationText,
          items: ['Post', 'Activity'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(
                  "$val",
                  style: textStyleAuthenticationText,
                ),
              );
            },
          ).toList(),
          onChanged: widget.onChange
        ),
      ),
    ));
  }
}
