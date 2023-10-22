import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hapex_admin/core/main_variables.dart';

class ApiClient {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': loginToken
  };

  Dio dio = Dio();

  Future<dynamic> get({required String endpoint}) async {
    print(baseUrl + endpoint);
    try {
      final response = await dio.get(baseUrl + endpoint);
      return response;
    } on DioException catch (e) {
      print('catch');
      print(e);
      if (e.response != null) {
        print('returning');
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return errorCustomeResponse(303);
      }
    }
  }

  Future<dynamic> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await dio.post(baseUrl + endpoint,
          data: data, options: Options(headers: headers));
      print('tried');
      return response;
    } on DioException catch (e) {
      print('catch');
      print(e);
      if (e.response != null) {
        print('returning');
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return errorCustomeResponse(303);
      }
    }
  }

  Future<dynamic> getFuture({required String endpoint}) async {
    print(baseUrl + endpoint);
    try {
      final response = await dio.get(baseUrl + endpoint);
      return response.data;
    } on DioException catch (e) {
      print('catch');
      print(e);
      if (e.response != null) {
        print('returning');
        return e.response!;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return errorCustomeResponse(303);
      }
    }
  }
}

class errorCustomeResponse {
  int statusCode;
  errorCustomeResponse(this.statusCode);
}

class AppRoutes {
  static bool loaderShowing = false;
  static bool internetLoaderShowing = false;

  // static Future<void> slidePageTransition(BuildContext context, page) async {
  //   return Navigator.of(context).push(SlideRightRoute(page: page),);
  //   // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // }

  static Future<void> goto(BuildContext context, Widget page) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => page,
      ),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (context) => page),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void makeFirst(BuildContext context, Widget page) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (context) => page),
    );
    // });

    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void dismissTillFirst(BuildContext context) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
  }

  static void dismissLoader(BuildContext context) {
    if (loaderShowing) {
      loaderShowing = false;
      Navigator.of(context).pop();
    }
  }

  static void dismissInternetLoader(BuildContext context) {
    if (internetLoaderShowing) {
      internetLoaderShowing = false;
      Navigator.of(context).pop();
    }
  }

  static void dismissAlert(BuildContext context) {
    Navigator.of(context).pop();
  }

  // static void showLoader(context) {
  //   loaderShowing = true;
  //   showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (BuildContext contextTemp) {
  //         return FullScreenLoader();
  //       });
  // }

  // static void showInternetLoader(context) {
  //   internetLoaderShowing = true;
  //   showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (BuildContext contextTemp) {
  //         return new InternetLoader();
  //       });
  // }
}

// To show snackBar
void showSnackBar(context, message, clr) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: clr,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(vertical: 15),
    content: Text(message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 3),
  ));
}

// class DioError {
//   ApiFailure getApiError(DioError e) {
//     if (e.response?.statusCode == 500) {
//       return ApiFailure('Server Error');
//     }
//     if (e.response?.statusCode == 401) {
//       return ApiFailure('Server Error');
//     }
//     if (e.response?.statusCode == 404) {
//       return ApiFailure('Not Found');
//     }
//     if (e.response?.statusCode == 405) {
//       return ApiFailure('Method Not Allowed');
//     }
//     if (DioErrorType.receiveTimeout == e.type) {
//       return ApiFailure('Send timeout in connection with API server');
//     }
//     if (e is SocketException) {
//       return ApiFailure('No internet connection');
//     }

//     return ApiFailure(e.response?.statusMessage ?? AppConstant.UnknownError);
//   }
// }

// ApiFailure(errorText) {}



// class ApiCall {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'authorization': loginToken
//   };

//   Future<Map<String, dynamic>> loadAjaxPost(
//       {required url, required body}) async {
//     final response = await http.post(Uri.parse(url),
//         headers: headers, body: jsonEncode(body));

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);

//       return jsonResponse;
//     } else {
//       throw Exception('');
//     }
//   }

//   Future<List<dynamic>> loadAjaxGet({required url}) async {
//     final response = await http.get(Uri.parse(url), headers: headers);

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);

//       return jsonResponse;
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }