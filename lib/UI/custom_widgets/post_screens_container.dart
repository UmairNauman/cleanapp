import 'package:cleanapp/UI/screens/post_screens/home_screen/home_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

class PostScreenContainer extends StatelessWidget {
  PostScreenContainer({
    @required this.profile,
    @required this.name,
    @required this.checkedIn,
    @required this.description,
    @required this.postPmage,
    @required this.timeStamp,
    @required this.like,
    @required this.dislike,
    @required this.countimage,
  });

  final profile;
  final name;
  final checkedIn;
  final description;
  final postPmage;
  final timeStamp;
  final like;
  final dislike; 
  var countimage;

//  final controller = PageController(keepPage: true);
  PageController _pageController = PageController();

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 17.h,
        ),
        Container(
          width: 357.w,
          height: 460.h,
          decoration: BoxDecoration(
              color: global.whiteColor,
              borderRadius: BorderRadius.circular(11.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        ///
                        ///Profile pic
                        ///
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 18.0),
                          child: Container(
                            width: 37.w,
                            height: 36.h,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("$dynamicImage/profile.png"),
                            ),
                          ),

                          // Container(
                          //     child: Image.asset(
                          //   profile,
                          //   width: 37.w,
                          //   height: 36.h,
                          // )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            ///profile name
                            ///

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 17),
                              child: Text(
                                name,
                                style: textStyleUserProfile,
                              ),
                            ),

                            ///
                            ///Time stamp
                            ///

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Text(
                                timeStamp.toString(),
                                style: textStyleTimeStamp,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///
                  ///Icon more vert
                  ///

                  Padding(
                    padding: const EdgeInsets.only(top: 23.0, right: 17),
                    child: InkWell(
                        child: Icon(
                      Icons.more_vert,
                      size: 23.h,
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),

              Container(
                height: 305.h,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ///
                          ///home image
                          ///
                          PageIndicatorContainer(
                            shape: IndicatorShape.circle(size: 6),
                            length: 3,
                            align: IndicatorAlign.bottom,
                            indicatorColor: global.profilePostCountColor,
                            indicatorSelectorColor: global.whiteColor,
                            indicatorSpace: 10.0,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: 3,
                              onPageChanged: (val) {
                                count = val;
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 345.w,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: countimage,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.network(
                                          postPmage[index],
                                          width: 341.w,
                                          height: 305.h,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ));
                              },
                            ),
                          ),

                          // Positioned(
                          //   bottom: 30,
                          //   left: 0,
                          //   right: 0,
                          //   child: Row(
                          //     children: [
                          //       ListView.builder(

                          //         itemBuilder:
                          //             (BuildContext context, int index) {
                          //           return Container(

                          //             height: 50,
                          //             width: 50,
                          //             color: Colors.grey,
                          //           );
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          ///
                          ///image count container
                          ///

                          Positioned(
                            left: 290.w,
                            top: 22.w,
                            child: Container(
                              alignment: Alignment.center,
                              width: 38.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                  color: global.greyColor,
                                  borderRadius: BorderRadius.circular(9.r)),
                              child: Text(
                                '$count / $countimage',
                                // countimage,
                                style: textImageCount,
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, bottom: 10.0),
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///
                                    ///like icon
                                    ///
                                    Image.asset(
                                      '$image/like_icon.png',
                                      height: 35.h,
                                      width: 35.w,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),

                                    ///
                                    ///count like
                                    ///
                                    Container(
                                      alignment: Alignment.center,
                                      width: 38.w,
                                      height: 18.h,
                                      decoration: BoxDecoration(
                                          color: global.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(9.r)),
                                      child: Text(
                                        "$like",
                                        style: textLikeCount,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, bottom: 10.0),
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///
                                    ///count dislike
                                    ///
                                    Container(
                                      alignment: Alignment.center,
                                      width: 38.w,
                                      height: 18.h,
                                      decoration: BoxDecoration(
                                          color: global.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(9.r)),
                                      child: Text(
                                        "$dislike",
                                        style: textLikeCount,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),

                                    ///
                                    ///dislike image
                                    ///
                                    Image.asset(
                                      '$image/dislike_icon.png',
                                      height: 35.h,
                                      width: 35.w,
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 5.h,
              ),

              ///
              ///location
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text(
                      "Dummy data Peshawar Pakistan",
                      style: textStyleTimeStamp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),

              ///
              ///profile name
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: textStyleUserProfile,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              ///
              ///decscription
              ///
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 40.h,
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Text(
                          description,
                          style: textStyleTimeStamp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
