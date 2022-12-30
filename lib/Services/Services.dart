import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omd_admin_panel/Constants/api_constants.dart';

class Services {
  changeScreenWithDelayAndPush(BuildContext context,
      Widget Function() screen, int timeInSeconds) {
    Timer(
      Duration(seconds: timeInSeconds),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen(),
        ),
      ),
    );
  }

  changeScreenWithDelayAndReplace(BuildContext context,
      Widget Function() screen, int timeInSeconds) {
    Timer(
      Duration(seconds: timeInSeconds),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => screen(),
            transitionsBuilder: (___, Animation<double> animation,
                ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }),
      ),
    );
  }

  Dio dioHelper() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        responseType: ResponseType.json,
        // headers: '',
      ),
    );
    return dio;
  }


}

//Navigator.push(context, PageRouteBuilder(
 //   pageBuilder: (BuildContext context, _, __) {
//     return Center(child: Text('My PageRoute'));
//   },
//   transitionsBuilder: (___, Animation  animation, ____, Widget child) {
//     return FadeTransition(
//       opacity: animation,
//       child: RotationTransition(
//         turns: Tween (begin: 0.5, end: 1.0).animate(animation),
//         child: child,
//       ),
//     );
//   }
// ));
