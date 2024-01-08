import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hapex_admin/core/common_widgets.dart';
import 'package:hapex_admin/core/constants.dart';

// ignore: must_be_immutable
class CurriculumAdministration extends StatelessWidget {
  CurriculumAdministration({super.key});
  String courseId = '';
  List courseList = [
    {'Curriculum_id': '1', 'name': 'Course'},
    {'Curriculum_id': '2', 'name': 'paper'},
    {'Curriculum_id': '3', 'name': 'module'},
    {'Curriculum_id': '4', 'name': 'Chapter'},
    {'Curriculum_id': '5', 'name': 'topic'},
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
          'Curriculum Administration',
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
                hint: const Text('Select Curriculum'),
                items: courseList.map<DropdownMenuItem<String>>((items) {
                  return DropdownMenuItem<String>(
                      value: items['Curriculum_id'].toString(),
                      child: Text(items['name']));
                }).toList(),
              ),
              kSizedBoxHeight(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: examDescription,
                      validatorMessage: 'Please enter search keyword',
                      hintText: 'Search keyword',
                      prefixIcon: Feather.file_text,
                    ),
                  ),
                  kSizedBoxWidth(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: kLightOcienBlueColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.search,
                        color: kIconBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
              kSizedBoxHeight(height: 10),
              Divider(),
              kSizedBoxHeight(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text('module $index'),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: kIconRedColor)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
