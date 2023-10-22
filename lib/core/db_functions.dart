import 'package:hapex_admin/core/main_variables.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabase {
//Initialise DB
  Future<void> dataBaseInitialise() async {
    await Hive.initFlutter();
    await Hive.openBox('loginDb');
    getUserDetails();
  }

//To add user Details
  Future<void> addUserDetails({required String userToken}) async {
    final loginDb = Hive.box('loginDb');
    await loginDb.put('userTokenKey', userToken);
    await getUserDetails();
  }

// To fetch user Details
  Future<void> getUserDetails() async {
    final loginDb = Hive.box('loginDb');
    final userToken = loginDb.get('userTokenKey');
    loginToken = userToken ?? '';
    // print('custUserToken : $custUserToken');
  }

// // To clear local db when user logs out
  Future<void> clearUserDetails() async {
    final loginDb = Hive.box('loginDb');
    await loginDb.delete('userTokenKey');
    getUserDetails();
  }
}
