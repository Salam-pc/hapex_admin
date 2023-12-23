// ignore_for_file: prefer_const_constructors

import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/screens/homepage/widget.dart';
import 'package:hapex_admin/screens/sub_pages/add_exams.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/add_courses.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/add_module.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/add_papers.dart';
import 'package:hapex_admin/screens/sub_pages/course_manage/add_topic.dart';
import 'package:hapex_admin/screens/sub_pages/manage_subscription.dart';
import 'package:hapex_admin/screens/sub_pages/user_details.dart';
import 'package:hapex_admin/screens/sub_pages/verify_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List buttons = [
    {'buttonText': 'Verify New Users', 'page': VerifyNewUsers()},
    {'buttonText': 'User details', 'page': UserDetails()},
    {'buttonText': 'Manage Subsciption', 'page': ManageSubscription()},
    {'buttonText': 'Add Courses', 'page': AddCourse()},
    {'buttonText': 'Add Papers', 'page': AddPapers()},
    {'buttonText': 'Add Modules', 'page': AddModule()},
    {'buttonText': 'Add Topic', 'page': AddTopic()},
    {'buttonText': 'Create Exams', 'page': CreateExams()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kMainBlueColor,
          centerTitle: true,
          title: Text(
            'EduGate',
            style: TextStyle(letterSpacing: 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              var button = buttons[index];
              return ElevatedButtonWidget(
                  buttenText: button['buttonText'], Page: button['page']);
            },
          ),
        ));
  }
}
