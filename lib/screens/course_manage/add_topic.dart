import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/course_manage/functions.dart';

class AddTopic extends StatelessWidget {
  AddTopic({super.key});

  final TextEditingController TopicName = TextEditingController();
  final _topicFormKey = GlobalKey<FormState>();
  var courseId = '';
  var paperId = '';
  var moduleId = '';
  final apiCall = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Add Topic',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Form(
        key: _topicFormKey,
        child: FutureBuilder(
          future: apiCall.getFuture(endpoint: '/api/courses'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic response = snapshot.data;
              List courseList = response['arrData'];
              List paperList = [];

              List modules = [];
              List moduleList = [];

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
                                value: courseId.isEmpty ? null : courseId,
                                isExpanded: true,
                                onChanged: (val) async {
                                  paperId = '';
                                  courseId = val.toString();
                                  var courseData = await funGetCourseData(
                                      context: context,
                                      courseId: val.toString());
                                  paperList = courseData['arrPapers'];
                                  modules = courseData['arrModules'];
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
                                value: paperId.isEmpty ? null : paperId,
                                isExpanded: true,
                                onChanged: (val) {
                                  print('object');
                                  print('$modules');

                                  moduleId = '';
                                  paperId = val.toString();
                                  moduleList.clear();
                                  for (var i = 0; i < modules.length; i++) {
                                    if ((modules[i]['paper_id']).toString() ==
                                        val.toString()) {
                                      moduleList.add(modules[i]);
                                    }
                                  }
                                  print(moduleList);
                                  dropdownRefreshVariable.notifyListeners();
                                },
                                hint: const Text('select Paper'),
                                items: paperList
                                    .map<DropdownMenuItem<String>>((items) {
                                  return DropdownMenuItem<String>(
                                      value: items['paper_id'].toString(),
                                      child: Text(items['paper_name']));
                                }).toList(),
                              ),
                              kSizedBoxHeight(height: 10),
                              Text('Select Module'),
                              kSizedBoxHeight(height: 5),
                              DropdownButton(
                                value: moduleId.isEmpty ? null : moduleId,
                                isExpanded: true,
                                onChanged: (val) {
                                  moduleId = val.toString();
                                  dropdownRefreshVariable.notifyListeners();
                                },
                                hint: const Text('select Module'),
                                items: moduleList
                                    .map<DropdownMenuItem<String>>((items) {
                                  return DropdownMenuItem<String>(
                                      value: items['module_id'].toString(),
                                      child: Text(items['module_name']));
                                }).toList(),
                              ),
                              kSizedBoxHeight(height: 10),
                              Text('Name'),
                              kSizedBoxHeight(height: 5),
                              TextFieldWidget(
                                  controller: TopicName,
                                  validatorMessage: 'Please enter Topic name',
                                  hintText: 'Topic name',
                                  prefixIcon: Feather.book),
                              kSizedBoxHeight(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (_topicFormKey.currentState!.validate()) {
                                    funAddTopic(
                                        topicName: TopicName.text,
                                        moduleId: moduleId,
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
