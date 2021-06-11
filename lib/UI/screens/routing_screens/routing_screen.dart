import 'package:cleanapp/UI/screens/post_screens/activity_screen/activity_screen.dart';
import 'package:cleanapp/UI/screens/post_screens/complete_screen/complete_screen.dart';
import 'package:cleanapp/UI/screens/post_screens/home_screen/home_screen.dart';
import 'package:cleanapp/UI/screens/profile_screen/profile_screens.dart';
import 'package:cleanapp/UI/screens/routing_screens/routing_screen_view_model.dart';
import 'package:cleanapp/UI/screens/upload_screen/upload_screen.dart';
import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List screenList = [
    HomeScreen(),
    CompleteScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final bottomNavigationViewModel =
    //     Provider.of<BottomNavigationViewModel>(context);
    return ChangeNotifierProvider(
        create: (context) => BottomNavigationViewModel(),
        child: Consumer<BottomNavigationViewModel>(
            builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: screenList[model.index],
            ),

            floatingActionButton: FloatingActionButton(
              backgroundColor: global.whiteColor,
              onPressed: () {
                Get.to(UploadScreen());
              },
              child: Image.asset(
                '$image/add.png',
                width: 17.78.w,
                height: 20.74.h,
              ),
            ),

            ///
            ///Bottom navigation bar
            ///
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              //  notchMargin: 3,
              //   clipBehavior: Clip.antiAlias,

              child: BottomNavigationBar(
                unselectedItemColor: global.whiteColor,
                selectedItemColor: global.whiteColor,
                iconSize: 25,
                backgroundColor: global.baseColor,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: global.whiteColor,
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset(
                          '$image/home.png',
                          width: 17.78.w,
                          height: 20.74.h,
                        ),
                      ),
                      title: Text("")),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 35),
                        child: Image.asset(
                          '$image/brush.png',
                          width: 17.78.w,
                          height: 20.74.h,
                        ),
                      ),
                      title: Text("")),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 35),
                        child: Image.asset(
                          '$image/like.png',
                          width: 17.78.w,
                          height: 20.74.h,
                        ),
                      ),
                      title: Text("")),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset(
                          '$image/profile.png',
                          width: 17.78.w,
                          height: 20.74.h,
                        ),
                      ),
                      title: Text("")),
                ],
                currentIndex: model.index,
                onTap: (index) {
                  model.setState(index);
                  // Provider.of<BottomNavigationViewModel>(context, listen: false)
                  //     .setState(index);
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        }));
  }
}
