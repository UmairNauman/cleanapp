import 'package:cleanapp/UI/custom_widgets/profile_screen_container.dart';
import 'package:cleanapp/UI/screens/profile_screen/profile_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart';
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileScreenViewModel(),
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Profile',
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
          body: SingleChildScrollView(
            primary: true,
            physics: BouncingScrollPhysics(),
                      child: Column(
              children: [

                        ///
                        ///profile data
                        ///

                Consumer<ProfileScreenViewModel>(
                    builder: (context, model, child) {
                  return ProfileScreenContainer(
                    postlength: model.post.length,
                    upvotes: '521',
                    name: model.post[2].name,
                    profile: model.post[1].profile,
                  );
                }),
                Consumer<ProfileScreenViewModel>(
                    builder: (context, model, child) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    // height: 310.3.h,
                    child: Scrollbar(
                                        child: ListView.builder(
                                          primary: false,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.post.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 174.w,
                                      height: 156.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                model.post[index].image)),
                                        borderRadius: BorderRadius.circular(6)),
                                    ),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    Container(
                                      width: 174.w,
                                      height: 156.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                model.post[index].image)),
                                        borderRadius: BorderRadius.circular(6)),
                                    ),
                                  ],
                                ),
                              );
                            }),
                    ),
                  );

                  // ListView.builder(
                  // physics: BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  // itemCount: model.post.length,
                  //   itemBuilder: (context, index) {
                  //     print('the leght is ${model.post.length}');
                  //     return ProfileScreenContainer(
                  //       name: model.post[index].name,
                  //       image: model.post[index].image,
                  //       postlength: model.post.length,
                  //       profile: model.post[index].profile,
                  //       upvotes: '5204',
                  //     );
                  //   },
                  //   // );
                  //   // }
                  // );
                }),
              ],
            ),
          ),
        ));
  }
}
