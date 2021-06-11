import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';
import 'package:cleanapp/core/models/app_user.dart';
import 'package:cleanapp/core/models/custom_auth_result.dart';
import 'package:cleanapp/core/services/auth_service.dart';
import 'package:cleanapp/core/services/shared_prefs_service.dart';
import 'package:cleanapp/locator.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  CustomAuthResult customAuthResult = CustomAuthResult();
  final _sharedPrefs = SharedPrefService();
  AppUser appUser = AppUser();
  final _authService = locator<AuthService>();
  CustomAuthResult? authResult;
  bool isShowPassword = false;

  loginWithEmailPassword() async {
    setState(ViewState.busy);

    print(" the user fullname is${appUser.fullName}");
    print(" the user password is${appUser.password}");
    _sharedPrefs.setLoginSharePrefs(
        emailController.text, passwordController.text);
    authResult = await _authService.loginWithEmailPassword(
        email: appUser.email, password: appUser.password);
    setState(ViewState.idle);
  }

  togglePassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
