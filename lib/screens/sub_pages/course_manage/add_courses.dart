import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddCourse extends StatelessWidget {
  AddCourse({super.key});

  final TextEditingController courseName = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
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
                  ElevatedButton(
                    onPressed: () {
                      if (_courseFormKey.currentState!.validate()) {
                        funAddCourse(
                            courseName: courseName.text,
                            courseDescription: courseDescription,
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
                        Text('Save',
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
