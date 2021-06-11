import 'package:cleanapp/core/models/app_user.dart';
import 'package:cleanapp/core/models/custom_auth_result.dart';
import 'package:cleanapp/core/services/auth_exception_service.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  CustomAuthResult customAuthResult = CustomAuthResult();
  final _auth = FirebaseAuth.instance;
  AppUser? appUser;
  final _dbService = DatabaseService();
  Future<CustomAuthResult> signUpWithEmailPassword(AppUser users) async {
    print('@services/singUpWithEmailPassword');
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: users.email!, password: users.password!);

      /// If user signup fails without any exception and error code
      if (credentials.user == null) {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
        return customAuthResult;
      }

      if (credentials.user != null) {
        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
        users.id = credentials.user!.uid;

        await _dbService.registerUser(users);
        this.appUser = users;
        notifyListeners();
      }
    } catch (e) {
      print('Exception @sighupWithEmailPassword: $e');
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }
   
     Future<CustomAuthResult> loginWithEmailPassword({email, password}) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credentials.user == null) {
        print("user is null");
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
      }

      ///
      /// If firebase auth is successful:
      ///
      if (credentials.user != null) {
           print("user is not null");
        this.appUser = await _dbService.getUser(credentials.user!.uid);
        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
      }
    } catch (e) {
         print("exception bbbbbbbbbbbbbbbbbbb");
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

}
