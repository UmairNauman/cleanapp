import 'package:cleanapp/UI/screens/upload_screen/upload_screen_view_model.dart';
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:cleanapp/core/others/Location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ProfileContainer extends StatelessWidget {
  final Post? post;
  final BuildContext? context;
  final geoLocation = LocationService();

  ProfileContainer({this.post, this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///
        ///Profile Pic
        ///

        Container(
          width: 37.w,
          height: 36.h,
          child: CircleAvatar(
            backgroundImage: AssetImage("${post!.profile}"),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            ///Profile Name
            ///

            Text(
              "${post!.name}",
              style: textStyleUserProfile,
            ),
            SizedBox(
              height: 3.h,
            ),

            ///
            ///Profile Location
            ///

            Consumer<UploadScreenViewModel>(
                builder: (context, model, snapshot) {
              return InkWell(
                onTap: () async {
                  model.getLocation();
                },
                child: Text(
                  'Add Location',
                  style: textStyleAddLocation,
                ),
              );
            })
          ],
        ),
      ],
    );
  }
}
