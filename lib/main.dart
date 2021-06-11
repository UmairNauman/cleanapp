import 'package:cleanapp/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'UI/screens/authentication_screens/login_screen/login_screen_view_model.dart';
import 'UI/screens/authentication_screens/registration_screen/registration_screen_view_model.dart';
import 'UI/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   setupLocator();
  runApp(MyApp());
 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenViewModel()),
        ChangeNotifierProvider(
            create: (context) => RegistrationScreenViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: Size(393, 851),
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clean app',
          theme: ThemeData(primaryColor: Color(0xFF00818A)),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
