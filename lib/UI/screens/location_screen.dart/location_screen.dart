import 'package:cleanapp/UI/custom_widgets/post_screens_container.dart';
import 'package:cleanapp/UI/screens/location_screen.dart/location_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart';
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocationScreenViewModel(),
        child:
            Consumer<LocationScreenViewModel>(builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Active Location',
                style: textStyleAppbarTitle,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    '$image/logo2.png',
                    height: 34.h,
                    width: 34.w,
                  ),
                )
              ],
            ),
            body: Center(
              child: Image.asset(
                '$dynamicImage/map.png',
                width: 410.w,
                height: 761.h,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: baseColor,
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.transparent,
                                  child: Container(
                            // height: 486.h,
                            color: whiteColor,
                            child: PostScreenContainer(
                                profile: model.post[0].profile,
                                name: model.post[0].name,
                                checkedIn: model.post[0].checkedIn,
                                description: model.post[0].description,
                                postPmage: model.post[0].image,
                                timeStamp: model.post[0].timeStamp,
                                like: model.post[0].like,
                                dislike: model.post[0].dislike,
                                countimage: model.post[0].countimage)),
                ));
                },
              child: Icon(Icons.gps_fixed),
            ),
          );
        }));
  }
}
