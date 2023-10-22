import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';

Future<bool> confirmationPopup({required context}) async {
  bool isConfirmed = false;
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            AntDesign.closesquareo,
            color: Colors.red,
          ),
          kSizedBoxHeight(height: 10),
          const Text(
            'Can you please confirm?',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: () {
                  isConfirmed = true;
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Colors.red[300],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Center(
                  child: Text('Confirm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return isConfirmed;
}

void userVerification(context) async {
  bool isConfirmed = await confirmationPopup(context: context);
  print(isConfirmed);
  isConfirmed
      ? showSnackBar(context, 'Verification Compleated', kSnackBarSuccessColor)
      : null;
}

void manageSubscription(context) async {
  bool isConfirmed = await confirmationPopup(context: context);
  print(isConfirmed);
  isConfirmed
      ? showSnackBar(context, 'Verification Compleated', kSnackBarSuccessColor)
      : null;
}
