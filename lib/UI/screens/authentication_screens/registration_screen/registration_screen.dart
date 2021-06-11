import 'package:cleanapp/UI/custom_widgets/authentication_button.dart';
import 'package:cleanapp/UI/custom_widgets/custom_text_field.dart';
import 'package:cleanapp/UI/screens/authentication_screens/login_screen/login_screen.dart';
import 'package:cleanapp/UI/screens/authentication_screens/registration_screen/registration_screen_view_model.dart';
import 'package:cleanapp/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final registrationViewModer = Provider.of<RegistrationScreenViewModel>(context);
    return SafeArea(child: Scaffold(
      body: Consumer<RegistrationScreenViewModel>(
          builder: (context, model, child) {
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
                          'Register with CleanApp to make the world a cleaner place.',
                          style: textStyleAuthenticationText,
                        ),

                        SizedBox(
                          height: 60.h,
                        ),

                        ///
                        ///For textfeild
                        ///

                        CustomTextField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "fill the field";
                            } else {
                              return null;
                            }
                          },
                          lableText: 'Full Name',
                          onChanged: (value) {
                            model.appUser.fullName = value;
                          },
                        ),
                        SizedBox(
                          height: 37.h,
                        ),

                        CustomTextField(
                          onChanged: (value) => model.appUser.email = value,
                          validator: (String? value) =>
                              value!.isEmpty ? "invalid email" : null,
                          lableText: 'Email',
                        ),
                        SizedBox(
                          height: 37.h,
                        ),

                        ///
                        ///For icon enalble and disable
                        ///

                        CustomTextField(
                          isObscureText: model.isShowPassword,
                          isPassword: true,
                          lableText: 'Password',
                          onChanged: (value) => model.appUser.password = value,
                          // onSaved:(){}
                          validator: (value) {
                            if (value.isEmpty) {
                              return "fill the field";
                            } else {
                              return null;
                            }
                          },
                          onIconPressed: () {
                            model.togglePassword();
                          },
                        ),

                        SizedBox(
                          height: 35.h,
                        ),

                        ///
                        ///Register button function
                        ///
                        AuthenticationButton(
                            onTap: () {
                              model.createAccount();
                              // if(formKey.currentState!.validate()){
                              //     formKey.currentState!.save();
                              // }
                            },
                            buttonText: 'REGISTER'),

                        SizedBox(
                          height: 45.h,
                        ),

                        Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: textStyleAccount,
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(LoginScreen());
                              },
                              child: Text(
                                " Login here.",
                                style: textStyleRegisterLogin,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 65.h,
                        ),
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
