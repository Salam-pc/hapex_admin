import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// ignore: must_be_immutable
class AddModule extends StatelessWidget {
  AddModule({super.key});

  final TextEditingController moduleName = TextEditingController();
  final _moduleFormKey = GlobalKey<FormState>();
  var courseId = '';
  var paperId = '';
  final apiCall = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Add Module',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Form(
        key: _moduleFormKey,
        child: FutureBuilder(
          future: apiCall.getFuture(endpoint: '/api/courses'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic response = snapshot.data;
              List courseList = response['arrData'];
              List paperList = [];
              return ValueListenableBuilder(
                  valueListenable: dropdownRefreshVariable,
                  builder: (context, value, child) {
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
                              DropdownButton(
                                isExpanded: true,
                                value: courseId.isNotEmpty ? courseId : null,
                                onChanged: (val) async {
                                  paperId = '';
                                  courseId = val.toString();
                                  var courseData = await funGetCourseData(
                                      context: context,
                                      courseId: val.toString());
                                  paperList = courseData['arrPapers'];
                                  dropdownRefreshVariable.notifyListeners();
                                },
                                hint: const Text('Course Name'),
                                items: courseList
                                    .map<DropdownMenuItem<String>>((items) {
                                  return DropdownMenuItem<String>(
                                      value: items['course_id'].toString(),
                                      child: Text(items['name']));
                                }).toList(),
                              ),
                              kSizedBoxHeight(height: 10),
                              Text('Select Paper'),
                              kSizedBoxHeight(height: 5),
                              DropdownButton(
                                isExpanded: true,
                                onChanged: (val) {
                                  paperId = val.toString();
                                  dropdownRefreshVariable.notifyListeners();
                                },
                                value: paperId.isNotEmpty ? paperId : null,
                                hint: const Text('select Paper'),
                                items: paperList
                                    .map<DropdownMenuItem<String>>((items) {
                                  return DropdownMenuItem<String>(
                                      value: items['paper_id'].toString(),
                                      child: Text(items['paper_name']));
                                }).toList(),
                              ),
                              kSizedBoxHeight(height: 10),
                              Text('Name'),
                              kSizedBoxHeight(height: 5),
                              TextFieldWidget(
                                  controller: moduleName,
                                  validatorMessage: 'Please enter Module name',
                                  hintText: 'Module name',
                                  prefixIcon: Feather.book),
                              kSizedBoxHeight(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (_moduleFormKey.currentState!.validate()) {
                                    funAddModule(
                                        moduleName: moduleName.text,
                                        paperId: paperId,
                                        courseId: courseId,
                                        context: context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kMainBlueColor,
                                  elevation: 0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                  });
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
