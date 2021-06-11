import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';
import 'package:cleanapp/core/models/app_user.dart';
import 'package:cleanapp/core/models/custom_auth_result.dart';
import 'package:cleanapp/core/services/auth_service.dart';
import 'package:cleanapp/locator.dart';

class RegistrationScreenViewModel extends BaseViewModel {
bool isShowPassword = false;
  AppUser appUser = AppUser();
  final _authService = locator<AuthService>();
  CustomAuthResult? authResult;

  createAccount() async {
    print('@ViewModel/createAccount');
    setState(ViewState.busy);
    print("the user email is ${appUser.email}");
    print("the user fullName is ${appUser.fullName}");
    print("the user password is ${appUser.password}");
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    authResult = await _authService.signUpWithEmailPassword(appUser);
    // if (authResult.status) {
    //   final newToken = await FirebaseMessaging().getToken();
    //   _dbService.updateFcmToken(newToken, authResult.user.uid);
    //   FirebaseMessaging().subscribeToTopic('students');
    // }
    setState(ViewState.idle);
  }
  togglePassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
