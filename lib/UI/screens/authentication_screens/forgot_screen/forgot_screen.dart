import 'package:cleanapp/UI/custom_widgets/authentication_button.dart';
import 'package:cleanapp/UI/custom_widgets/custom_text_field.dart';
import 'package:cleanapp/core/constants/colors.dart' as global;
import 'package:cleanapp/core/constants/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late String email;

  sendResetPasswordLink() {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: this.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email')
        Get.snackbar("Alert", "Invalid Email");
      //showDigloge
      else if (e.code == 'auth/user-not-found') ;

      Get.snackbar("Alert", "User not find");
      // Get.dialog(widget);

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),

              ///
              ///Authentication title
              ///

              Padding(
                padding: const EdgeInsets.only(left: 44.0 / 2),
                child: Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: global.baseColor,
                        )),
                    Text(
                      'Forgot Password',
                      textAlign: TextAlign.start,
                      style: textStyleAuthenticationTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No worries!",
                      style: textStyleAuthenticationText,
                    ),
                    Text(
                      "Just enter your email and we will send you the instructions to reset.",
                      style: textStyleAuthenticationText,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),

                    ///
                    ///For textfeild
                    ///

                    CustomTextField(
                      lableText: 'Enter Email',
                      validator: (value) {
                        if (value.isEmpty) {
                          return "fill the field";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        email = val;
                      },
                    ),

                    SizedBox(
                      height: 10.7.h,
                    ),

                    Text(
                      'Please enter your email address',
                      style: textStyleAccount,
                    ),

                    SizedBox(
                      height: 49.h,
                    ),

                    ///
                    ///Login button function
                    ///
                    AuthenticationButton(
                        onTap: () {}, buttonText: 'RESET PASSWORD'),

                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
