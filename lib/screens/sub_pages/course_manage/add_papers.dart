import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// ignore: must_be_immutable
class AddPapers extends StatelessWidget {
  AddPapers({super.key});

  final TextEditingController papername = TextEditingController();
  final _paperFormKey = GlobalKey<FormState>();
  var courseId = '';
  final apiCall = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Add Paper',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Form(
        key: _paperFormKey,
        child: FutureBuilder(
          future: apiCall.getFuture(endpoint: '/api/courses'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic response = snapshot.data;
              List courseList = response['arrData'];
              print(courseId);
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kSizedBoxHeight(height: 10),
                        Text('Select course'),
                        kSizedBoxHeight(height: 5),
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'Please Select a Course' : null,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          value: courseId.isEmpty ? null : courseId,
                          isExpanded: true,
                          focusColor: Colors.grey,
                          onChanged: (val) {
                            courseId = val.toString();
                          },
                          hint: const Text('Course Name'),
                          items:
                              courseList.map<DropdownMenuItem<String>>((items) {
                            return DropdownMenuItem<String>(
                                value: items['course_id'].toString(),
                                child: Text(items['name']));
                          }).toList(),
                        ),
                        kSizedBoxHeight(height: 10),
                        Text('Name'),
                        kSizedBoxHeight(height: 5),
                        TextFieldWidget(
                            controller: papername,
                            validatorMessage: 'Please enter Paper name',
                            hintText: 'Paper name',
                            prefixIcon: Feather.book),
                        kSizedBoxHeight(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (_paperFormKey.currentState!.validate()) {
                              funAddPaper(
                                  paperName: papername.text,
                                  courseId: courseId,
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
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('${snapshot.error}');
            } else {
              return kLoadingIndicator;
            }
          },
        ),
      ),
    );
  }
}
