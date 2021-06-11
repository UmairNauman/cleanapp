import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPreferences? sharedPrefsRef;

  SharedPrefService() {
    init();
  }

  init() async {
    if (sharedPrefsRef == null) {
      sharedPrefsRef = await SharedPreferences.getInstance();
    }
  }

  setLoginSharePrefs(String email, String password) async {
    await init();
    sharedPrefsRef!.setString('email', email);
    sharedPrefsRef!.setString('password', password);
  }

  void autoLogIn() async {
    await init();
    final String? email = sharedPrefsRef!.getString('email');
    final String? password = sharedPrefsRef!.getString('password');
  }
}
