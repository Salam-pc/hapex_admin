import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget(
      {super.key, required this.buttenText, required this.Page});
  final String buttenText;
  final Widget Page;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kMainOrengeColor,
        elevation: 5,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        buttenText,
        style: TextStyle(color: kMainCreamColor),
      ),
      onPressed: () {
        AppRoutes.goto(context, Page);
      },
    );
  }
}
