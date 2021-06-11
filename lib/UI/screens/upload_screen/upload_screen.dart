import 'package:cleanapp/UI/custom_widgets/authentication_button.dart';
import 'package:cleanapp/UI/custom_widgets/description_textfeild.dart';
import 'package:cleanapp/UI/custom_widgets/dropdown_list.dart';
import 'package:cleanapp/UI/custom_widgets/profile_container.dart';
import 'package:cleanapp/UI/custom_widgets/upload_button.dart';
import 'package:cleanapp/UI/custom_widgets/upload_container.dart';
import 'package:cleanapp/UI/screens/upload_screen/upload_screen_view_model.dart';
import 'package:cleanapp/core/constants/colors.dart';
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:cleanapp/core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UploadScreenViewModel(),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'New Post',
                style: textStyleAppbarTitle,
              ),
            ),
            body: Consumer<UploadScreenViewModel>(
                builder: (context, model, child) {
              return model.state == ViewState.busy
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                width: 356.w,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 22.h,
                                    ),

                                    ///
                                    ///Profile container
                                    ///

                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: ProfileContainer(
                                        context: context,
                                        post: model.post[0],
                                        // profile: model.post[0].profile,
                                        // name: model.post[1].name,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),

                                    ///
                                    ///upload container
                                    ///
                                    model.images.length == 0
                                        ? Container(
                                            height: 305.h,
                                            width: 356.w,
                                            color: uploadCnntainerColor,
                                            child: Center(
                                              child: InkWell(
                                                  onTap: () {
                                                    model.pickImage();
                                                  },
                                                  child: Icon(
                                                    Icons.cloud_upload_outlined,
                                                    size: 50,
                                                    color: Colors.grey,
                                                  )),
                                            ))
                                        : Container(
                                            height: 305.h,
                                            width: 356.w,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: model.images.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Image.file(
                                                    model.images[index]);
                                              },
                                            ),
                                          ),
                                    // UploadContainer(
                                    //   onTap: () {},
                                    //   icon: Icons.cloud_upload_outlined,
                                    // ),

                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Description",
                                          style: textStyleOnboarding2,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),

                                    ///
                                    ///Description TextFeild
                                    ///
                                    DescripionTextfeild(
                                      onChanged: (val) =>
                                          model.report.description = val,
                                    ),
                                    SizedBox(
                                      height: 9.3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Post type",
                                          style: textStyleOnboarding2,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.7.h,
                                    ),

                                    ///
                                    ///Drop Down List
                                    ///
                                    DropDownList(
                                      onChange: (value) => model.selectPostType(value),
                                      model: model,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 57.h,
                              ),

                              ///
                              ///Upload button
                              ///

                              UploadButton(
                                  onTap: () async {
                                    await model.uploadData();
                                  },
                                  buttonText: 'UPLOAD')
                            ],
                          ),
                        ),
                      ],
                    );
            })));
  }

  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     scrollDirection: Axis.horizontal,
  //     children: List.generate(images.length, (index) {
  //       Asset asset = images[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 50,
  //         height: 50,
  //       );
  //     }),
  //   );
  // }

  // Future<void> loadAssets() async {
  //   List<Asset> resultList = <Asset>[];

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 3,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Example App",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {}

  //   setState(() {
  //     images = resultList;
  //   });
  // }
}
