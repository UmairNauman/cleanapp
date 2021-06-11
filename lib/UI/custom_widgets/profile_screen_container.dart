import 'package:cleanapp/UI/screens/profile_screen/profile_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreenContainer extends StatelessWidget {
  ProfileScreenContainer({
    // @required this.image,
    @required this.profile,
    @required this.name,
    @required this.postlength,
    @required this.upvotes,
  });

  // final image;
  final profile;
  final name;
  final postlength;
  final upvotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 28.h,
        ),

        ///
        ///profile pic
        ///

        Container(
          width: 133.w,
          height: 133.h,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              '$profile',
            ),
          ),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              color: global.baseColor,
              width: 5.0,
            ),
          ),
        ),

        SizedBox(
          height: 10.h,
        ),

        ///
        ///profile name
        ///
        Text(
          '$name',
          style: textStyleProfileName,
        ),

        ///
        ///contributer
        ///
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Star Contributor",
          style: textStyleContributer,
        ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///
            ///post lenght
            ///

            Column(
              children: [
                Text(
                  postlength.toString(),
                  style: textStylePofilePostCount,
                ),
                Text(
                  'Reports',
                  style: textStyleCount,
                )
              ],
            ),

            ///
            ///compeleted post
            ///
            Column(
              children: [
                Text(
                  '17',
                  style: textStylePofilePostCount,
                ),
                Text(
                  "Activity",
                  style: textStyleCount,
                ),
              ],
            ),

            ///
            ///upvotes
            ///

            Column(
              children: [
                Text(
                  '$upvotes',
                  style: textStylePofilePostCount,
                ),
                Text(
                  'upvotes',
                  style: textStyleCount,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 46.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ///
            ///Activity button
            ///
            Consumer<ProfileScreenViewModel>(
                builder: (context, model, snapshot) {
              return InkWell(
                onTap: () {
                  Provider.of<ProfileScreenViewModel>(context, listen: false)
                      .setState(false);
                },
                child: Column(
                  children: [
                    Text(
                      'Posts',
                      style: textStyleActivityPost,
                    ),
                    model.activityPost == false
                        ? Image.asset(
                            '$image/line.png',
                            width: 39.w,
                          )
                        : Container()
                  ],
                ),
              );
            }),

            ///
            ///Post button
            ///

            Consumer<ProfileScreenViewModel>(builder: (context, model, child) {
              return InkWell(
                onTap: () {
                  Provider.of<ProfileScreenViewModel>(context, listen: false)
                      .setState(true);
                },
                child: Column(
                  children: [
                    Text(
                      'Activities',
                      style: textStyleActivityPost,
                    ),
                    model.activityPost == true
                        ? Image.asset(
                            '$image/line.png',
                            width: 39.w,
                          )
                        : Container()
                  ],
                ),
              );
            }),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
