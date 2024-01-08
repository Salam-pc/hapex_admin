import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/presentation/login_page/function.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_vector.png'),
                    fit: BoxFit.cover)),
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  kSizedBoxHeight(height: 50),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user_icon.png'),
                    radius: 50,
                  ),
                  const Text(
                    'USER LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blueGrey,
                    ),
                  ),
                  kSizedBoxHeight(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20.0),
                      child: Column(
                        children: [
                          TextFieldWidget(
                              controller: username,
                              validatorMessage: 'Please enter your username',
                              hintText: 'username',
                              prefixIcon: Feather.user),
                          kSizedBoxHeight(height: 10),
                          TextFieldWidget(
                              controller: password,
                              validatorMessage: 'Please enter the password',
                              hintText: 'password',
                              prefixIcon: Feather.lock),
                          kSizedBoxHeight(height: 10),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        doLogin(
                            username: username.text,
                            password: password.text,
                            context: context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMainBlueColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Login',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
