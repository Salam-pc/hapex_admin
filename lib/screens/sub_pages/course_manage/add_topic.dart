import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/functions.dart';

class AddTopic extends StatelessWidget {
  AddTopic({super.key});

  final TextEditingController topicName = TextEditingController();
  final TextEditingController videoUrl = TextEditingController();

  final _topicFormKey = GlobalKey<FormState>();
  var courseId = '';
  var paperId = '';
  var moduleId = '';
  var videoUrls = [];
  final apiCall = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: const Text(
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
                              const Text('Select course'),
                              kSizedBoxHeight(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                    color: klightGreyColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropdownButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                              ),
                              kSizedBoxHeight(height: 10),
                              const Text('Select Paper'),
                              kSizedBoxHeight(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                    color: klightGreyColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropdownButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  value: paperId.isEmpty ? null : paperId,
                                  isExpanded: true,
                                  onChanged: (val) {
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
                              ),
                              kSizedBoxHeight(height: 10),
                              const Text('Select Module'),
                              kSizedBoxHeight(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                    color: klightGreyColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropdownButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                              ),
                              kSizedBoxHeight(height: 10),
                              const Text('Name'),
                              kSizedBoxHeight(height: 5),
                              TextFieldWidget(
                                  controller: topicName,
                                  validatorMessage: 'Please enter Topic name',
                                  hintText: 'Topic name',
                                  prefixIcon: Feather.book),
                              kSizedBoxHeight(height: 10),
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: List.generate(
                                  videoUrls.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text('${index + 1} '),
                                          kSizedBoxWidth(width: 10),
                                          Expanded(
                                            child: Text(
                                              videoUrls[index],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              videoUrls.removeAt(index);
                                              dropdownRefreshVariable
                                                  .notifyListeners();
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline_rounded),
                                            color: kIconRedColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              kSizedBoxHeight(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: klightGreyColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextField(
                                    controller: videoUrl,
                                    onSubmitted: (value) {
                                      videoUrls.add(value.toString());
                                      videoUrl.clear();
                                      dropdownRefreshVariable.notifyListeners();
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.video_camera_back_outlined,
                                        color: Colors.blueGrey[600], //color???
                                      ), //icon change
                                      border: InputBorder.none,
                                      fillColor: Colors.black,
                                      hintText: 'Add video URL here',
                                      hintStyle: const TextStyle(
                                          letterSpacing: 0.6,
                                          fontWeight: FontWeight.w400),
                                      counterText: '',
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          12, 15, 12, 15),
                                    )),
                              ),
                              kSizedBoxHeight(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  if (_topicFormKey.currentState!.validate()) {
                                    funAddTopic(
                                        topicName: topicName.text,
                                        videoUrls: videoUrls,
                                        courseId: courseId,
                                        paperId: paperId,
                                        moduleId: moduleId,
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
