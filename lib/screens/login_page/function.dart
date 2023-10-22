import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/db_functions.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/core/main_variables.dart';
import 'package:hapex_admin/screens/homepage/homepage.dart';

doLogin({required username, required password, required context}) async {
  final apiCall = ApiClient();
  const url = '/api/login';
  final body = {
    'username': username,
    'password': password,
  };
  print('$username  hjdshs $password');
  if (username == 'jabir' && password == '123456') {
    showSnackBar(context, 'Login Successfull', kSnackBarSuccessColor);
    AppRoutes.makeFirst(context, HomePage());
    print('went to home page');
  } else {
    showSnackBar(context, 'Login Failed', kSnackBarErrorColor);
  }

  // uncoment this
  //  final response = await apiCall.post(endpoint: url, data: body);
  // print('passed');

  // if (response.statusCode == 200) {
  //   final data = response.data;
  //   print(data['token']);
  //   LocalDatabase().addUserDetails(loiginToken: data['token']);
  //   showSnackBar(context, 'Login Successfull', kSnackBarSuccessColor);
  //   AppRoutes.makeFirst(context, const HomePage());
  //   print('went to home page');
  // } else if (response.statusCode == 400) {
  //   showSnackBar(context, 'Login Failed', kSnackBarErrorColor);
  // } else {
  //   // exception calling
  //   // showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  // }
}
