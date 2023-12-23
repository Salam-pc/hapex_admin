import 'package:hapex_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget kSizedBoxWidth({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget kSizedBoxHeight({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget kLoadingIndicator = Center(
    child: SpinKitThreeBounce(
  //SpinKitFadingCube SpinKitDualRing SpinKitWave SpinKitThreeBounce SpinKitFadingCircle
  //SpinKitDualRing SpinKitThreeBounce
  color: kMainBlueColor,
  // size: 50.0,
));

// ignore_for_file: prefer_typing_uninitialized_variables

class TextFieldWidget extends StatelessWidget {
  final controller;
  final validatorMessage;
  final hintText;
  final prefixIcon;
  final isPassword;
  final minLines;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.validatorMessage,
      required this.hintText,
      this.prefixIcon,
      this.isPassword,
      this.minLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: klightGreyColor, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          obscureText: isPassword ?? false,
          minLines: minLines,
          maxLines: minLines,
          style: TextStyle(
              color: kTextBlackColor,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String name) {},
          onTap: () {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            } else if (hintText == 'Email' && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.blueGrey[600], //color???
            ), //icon change
            border: InputBorder.none,
            fillColor: Colors.black,
            hintText: hintText,
            hintStyle: const TextStyle(
                letterSpacing: 0.6, fontWeight: FontWeight.w400),
            counterText: '',
            contentPadding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
          )),
    );
  }
}

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer(
      {super.key,
      required this.height,
      required this.width,
      this.borderRad = 0});
  final height;
  final width;
  final borderRad;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        height: height,
        width: width,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(borderRad)));
  }
}
