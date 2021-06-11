import 'package:cleanapp/UI/custom_widgets/image_container.dart';
import 'package:cleanapp/UI/custom_widgets/rounded_button.dart';
import 'package:cleanapp/UI/screens/authentication_screens/login_screen/login_screen.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:cleanapp/core/models/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///This screen is used as landing screen or onboarding which will be shown to user after splash screen
///
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //for pageview builder purpose
  int? currentIndexPage;
  PageController? onboardController;
  List<OnBoarding> onboardings = [];

  @override
  void initState() {
    super.initState();
    //injecting onboardings data
    injectOnboardings();
    onboardController = PageController(initialPage: 0);
    currentIndexPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        ///
        ///[body] starts from here
        ///
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ///Page View builder having onboarding tiles
            pageViewBuilder(),
          ],
        ),
      ),
    );
  }

  //skip and next button row
  skipAndNextButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 33,
        right: 33.0,
        bottom: 45,
      ),
      child: currentIndexPage == 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotContainer(
                  assetsImages: "$image/dot${currentIndexPage! + 1}.png",
                  h: 12.h,
                  w: 51.w,
                ),
                Container(
                  height: 46.h,
                  width: 46.w,
                  child: RoundedButton(
                      icon: '$image/complete.png',
                      onTap: () {
                        Get.to(LoginScreen());
                      }),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///
                /// womb like pageview indicator
                ///
                Container(
                  child: Center(
                    child: DotContainer(
                      assetsImages: "$image/dot${currentIndexPage! + 1}.png",
                      h: 12.h,
                      w: 51.w,
                    ),
                  ),
                ),
                //next button
                Container(
                  height: 46.h,
                  width: 46.w,
                  child: RoundedButton(
                    icon: '$image/arrowforward.png',
                    onTap: () {
                      onboardController!.nextPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.easeIn);
                    },
                  ),
                )
              ],
            ),
    );
  }

  ///Page View builder having onboarding assets
  pageViewBuilder() {
    return Container(
      // color: Colors.red,
      height: 800.h,
      // width: 340.27.w, // 380.h, //400,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: onboardController!,
        itemCount: onboardings.length,
        // physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10.h,
              ),

              Container(
                child: Image.asset(
                  onboardings[index].imageUrl!,
                  height: 324.07.h,
                  width: 341.85.w,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              Container(
                  // height: 45.h,
                  ),

              pageViewBuilder2(),

              ///title and subtitle of onboardings

              Container(),
              //skip and next button row
              skipAndNextButton(),
            ],
          );
        },
        //calling on pageChanged function to get index
        onPageChanged: (int index) {
          print(index);
          setState(() {
            currentIndexPage = index;
          });
        },
      ),
    );
  }

  // onboardingTile(OnBoarding onboard) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage(onboard.imageUrl!), fit: BoxFit.fill)),
  //   );
  // }

  pageViewBuilder2() {
    return Container(
      width: 340.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${onboardings[currentIndexPage!].title!}",
                style: textStyleOnboarding,
                // style: headingTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "${onboardings[currentIndexPage!].content!}",
            style: textStyleOnboarding2,
            // style: bodyTextStyle.copyWith(color: greyColor),
          ),
        ],
        //       ),
      ),
    );
  }

  injectOnboardings() {
    onboardings.add(OnBoarding(
        imageUrl: "$image/firstonboarding.png",
        title: "Report Cleanliness \nof a spot.",
        content:
            "Report a dirty locations for the purpose to be cleaned by the community  "));

    onboardings.add(OnBoarding(
      imageUrl: "$image/secondonboarding.png",
      title: "Create activities \nby doing cleanliness",
      content:
          "Create cleanliness activities so that others can inspire and motivate  ",
    ));
    onboardings.add(OnBoarding(
        imageUrl: "$image/thirdonboarding.png",
        title: "Get inspired \nby Others activities",
        content:
            "Get inspired and motivated by the activities done by others  "));
  }
}
