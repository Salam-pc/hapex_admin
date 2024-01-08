import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/presentation/sub_pages/curriculum_manage/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/presentation/widgets/gradient_button.dart';

class AddCourse extends StatelessWidget {
  AddCourse({super.key});

  final TextEditingController courseName = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
  final TextEditingController courseCost = TextEditingController();
  final _courseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Add Course',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Form(
        key: _courseFormKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBoxHeight(height: 10),
                  Text('Name'),
                  kSizedBoxHeight(height: 5),
                  TextFieldWidget(
                      controller: courseName,
                      validatorMessage: 'Please enter Course name',
                      hintText: 'course name',
                      prefixIcon: Feather.book),
                  kSizedBoxHeight(height: 10),
                  Text('Description'),
                  kSizedBoxHeight(height: 5),
                  TextFieldWidget(
                      controller: courseDescription,
                      validatorMessage: 'Please enter description',
                      hintText: 'course description',
                      prefixIcon: Feather.file_text),
                  kSizedBoxHeight(height: 10),
                  Text('Price'),
                  TextFieldWidget(
                    controller: courseCost,
                    validatorMessage: 'Please enter the price',
                    hintText: 'course price',
                    prefixIcon: Feather.file_text,
                    textInputType: TextInputType.number,
                  ),
                  kSizedBoxHeight(height: 10),
                  DropdownButtonFormField(
                    items: [
                      'Yes',
                      'No',
                    ].map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  kSizedBoxHeight(height: 10),
                  GradientButton(
                      onPressed: () {
                        if (_courseFormKey.currentState!.validate()) {
                          funAddCourse(
                              courseName: courseName.text,
                              courseDescription: courseDescription,
                              context: context);
                        }
                      },
                      buttonName: 'Save'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
