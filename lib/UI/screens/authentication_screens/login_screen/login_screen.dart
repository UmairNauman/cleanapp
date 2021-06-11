import 'package:cleanapp/UI/custom_widgets/authentication_button.dart';
import 'package:cleanapp/UI/custom_widgets/custom_text_field.dart';
import 'package:cleanapp/UI/screens/authentication_screens/forgot_screen/forgot_screen.dart';
import 'package:cleanapp/UI/screens/authentication_screens/login_screen/login_screen_view_model.dart';
import 'package:cleanapp/UI/screens/authentication_screens/registration_screen/registration_screen.dart';
import 'package:cleanapp/UI/screens/routing_screens/routing_screen.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<LoginScreenViewModel>(builder: (context, model, child) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 301.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),

                        ///
                        ///Authentication title
                        ///

                        Text(
                          'Welcome Back To CleanApp',
                          style: textStyleAuthenticationTitle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Log in to your existing account to startmaking the world a cleaner place.',
                          style: textStyleAuthenticationText,
                        ),

                        SizedBox(
                          height: 60.h,
                        ),

                        ///
                        ///For textfeild
                        ///

                        CustomTextField(
                          controller: model.emailController,
                          lableText: 'Email',
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter a valid email address.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) => model.appUser.email = value,
                        ),
                        SizedBox(
                          height: 37.h,
                        ),

                        ///
                        ///For icon enalble and disable
                        ///

                        CustomTextField(
                            controller: model.passwordController,
                            isObscureText: model.isShowPassword,
                            isPassword: true,
                            lableText: 'Password',
                            onIconPressed: () {
                              model.togglePassword();
                            },
                            validator: (val) =>
                                val.length == 0 ? "fill the field" : null,
                            onChanged: (value) {
                              print(value);
                              model.appUser.password = value;
                            }),

                        SizedBox(
                          height: 15.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ForgotScreen());
                              },
                              child: Text('Forgot Password?',
                                  style: textStyleForgotPassword),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.h,
                        ),

                        ///
                        ///Login button function
                        ///
                        AuthenticationButton(
                            onTap: () {
                              // model.loginWithEmailPassword();
                              // if (model.authResult!.status!) {
                              //   Get.to(BottomNavigationScreen());
                              // }

                              Get.to(BottomNavigationScreen());

                              // if (formKey.currentState!.validate()) {
                              //   Get.to(BottomNavigationScreen());
                              // }
                            },
                            buttonText: 'LOGIN'),

                        SizedBox(
                          height: 35.h,
                        ),

                        Row(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: textStyleAccount,
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(RegistrationScreen());
                              },
                              child: Text(
                                " Register here.",
                                style: textStyleRegisterLogin,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
