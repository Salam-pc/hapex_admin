import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/constants.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  const GradientButton(
      {Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: 395,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Pallete.kButtonGradient1,
              Pallete.kButtonGradient2,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 0,
              top: 0,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: kBGWhiteColor,
                child: const Icon(Feather.arrow_right,
                    color: Pallete.kMainButtonColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
