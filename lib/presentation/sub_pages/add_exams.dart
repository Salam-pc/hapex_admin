import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';

// ignore: must_be_immutable
class CreateExams extends StatelessWidget {
  CreateExams({super.key});
  String courseId = '';
  List courseList = [
    {'course_id': '1', 'name': 'asdf'},
    {'course_id': '2', 'name': 'qwer'},
    {'course_id': '3', 'name': 'ifsc'},
  ];
  final TextEditingController examName = TextEditingController();
  final TextEditingController examDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: const Text(
          'Create Exams',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                isExpanded: true,
                value: courseId.isNotEmpty ? courseId : null,
                onChanged: (val) async {
                  courseId = val.toString();
                },
                hint: const Text('Choose Course'),
                items: courseList.map<DropdownMenuItem<String>>((items) {
                  return DropdownMenuItem<String>(
                      value: items['course_id'].toString(),
                      child: Text(items['name']));
                }).toList(),
              ),
              kSizedBoxHeight(height: 10),
              Text('Exam Name'),
              kSizedBoxHeight(height: 5),
              TextFieldWidget(
                  controller: examName,
                  validatorMessage: 'Please enter test name',
                  hintText: 'Test name',
                  prefixIcon: Feather.file_text),
              kSizedBoxHeight(height: 10),
              Text('Exam Description'),
              kSizedBoxHeight(height: 5),
              TextFieldWidget(
                controller: examDescription,
                validatorMessage: 'Please enter test Description',
                hintText: 'Test Description',
                prefixIcon: Feather.file_text,
                minLines: 5,
                textInputType: TextInputType.multiline,
              ),
              kSizedBoxHeight(height: 10),
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
