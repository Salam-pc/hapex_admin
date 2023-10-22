import 'package:flutter/material.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';

ValueNotifier<int> dropdownRefreshVariable = ValueNotifier(0);

funAddCourse(
    {required courseName, required courseDescription, required context}) async {
  final apiCall = ApiClient();
  const url = '/api/courses';
  final body = {
    'strCourse': courseName,
  };

  final response = await apiCall.post(endpoint: url, data: body);
  if (response.statusCode == 200) {
    showSnackBar(context, 'Course added Successfully', kSnackBarSuccessColor);
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Adding Failed', kSnackBarErrorColor);
  } else {
    showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  }
}

//functionto add paper based on course
funAddPaper({required paperName, required courseId, required context}) async {
  final apiCall = ApiClient();
  const url = '/api/papers';
  final body = {
    'strPaper': paperName,
    'strCourseId': courseId,
  };
  final response = await apiCall.post(endpoint: url, data: body);
  if (response.statusCode == 200) {
    final data = response.data;
    showSnackBar(context, 'Success', kSnackBarSuccessColor);
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Failed', kSnackBarErrorColor);
  } else {
    showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  }
}

//function to add module under course and paper
funAddModule(
    {required moduleName,
    required paperId,
    required courseId,
    required context}) async {
  final apiCall = ApiClient();
  const url = '/api/modules';
  final body = {
    'strModule': moduleName,
    'strCourseId': courseId,
    'strPaperId': paperId,
  };
  final response = await apiCall.post(endpoint: url, data: body);
  if (response.statusCode == 200) {
    final data = response.data;
    // LocalDatabase().addUserDetails(userToken: data['token']);
    showSnackBar(context, 'Success', kSnackBarSuccessColor);
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Failed', kSnackBarErrorColor);
  } else {
    showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  }
}

//function to add topic under course -> paper -> module
funAddTopic(
    {required topicName,
    required paperId,
    required courseId,
    required moduleId,
    required context}) async {
  final apiCall = ApiClient();
  const url = '/api/cources';
  final body = {
    'strCourse': topicName,
  };
  final response = await apiCall.post(endpoint: url, data: body);
  if (response.statusCode == 200) {
    showSnackBar(context, 'Success', kSnackBarSuccessColor);
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Failed', kSnackBarErrorColor);
  } else {
    showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  }
}

Future funGetCourseData({required courseId, required context}) async {
  print('enterd');
  final apiCall = ApiClient();
  final url = '/api/papers?course_id=$courseId';

  final response = await apiCall.get(endpoint: url);
  if (response.statusCode == 200) {
    print(response.data);
    return response.data;
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Coudn\'t find papers', kSnackBarErrorColor);
  } else {
    showSnackBar(context, 'Something Went Wrong', kSnackBarErrorColor);
  }
  return [];
}
