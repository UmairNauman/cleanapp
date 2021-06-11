import 'package:cleanapp/core/services/auth_service.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthService());
  locator.registerSingleton(DatabaseService());
}
