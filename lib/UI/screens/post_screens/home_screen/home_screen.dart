import 'package:cleanapp/UI/custom_widgets/post_screens_container.dart';
import 'package:cleanapp/UI/screens/location_screen.dart/location_screen.dart';
import 'package:cleanapp/UI/screens/post_screens/home_screen/home_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:cleanapp/core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewMode(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
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
        body:
            //  Consumer<HomeScreenViewMode>(builder: (context, model, child) {
            // return
            Consumer<HomeScreenViewMode>(
          builder: (context, model, child) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: model.state == ViewState.busy
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.reportsList.length,
                    // itemCount:model.post.length,
                    itemBuilder: (context, index) {
                      return PostScreenContainer(
                        // profile: model.reportsList[index].profile,
                        name: model.reportsList[index].userName,
                        checkedIn: model.postAddress,
                        description: model.reportsList[index].description,
                        postPmage: model.reportsList[index].imgUrls,
                        timeStamp: model.reportsList[index].timeStamp,
                        like: model.reportsList[index].noOfUpvotes,
                        dislike: model.reportsList[index].noOfDownVotes,
                        countimage: model.reportsList[index].imgUrls!.length,
                      );
                    },
                    // );
                    // }
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "map",
          backgroundColor: global.baseColor,
          onPressed: () {
            Get.to(LocationScreen());
          },
          child: Image.asset(
            '$image/map.png',
            width: 21.64.w,
            height: 19.37.h,
          ),
        ),
      ),
    );
  }
}
