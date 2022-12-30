import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:omd_admin_panel/Constants/api_constants.dart';
import 'package:omd_admin_panel/Model/Response/UserModel/OneUserData.dart';
import 'package:omd_admin_panel/Model/Response/UserModel/list_all_users.dart';

class UserDataProvider{
  final _baseUrl = ApiConstants.baseUrl;
  final _allUserUrl = ApiConstants.listAllUsers;
  final _oneUserUrl = ApiConstants.oneUsers;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,

    )
  );



  Future<ListAllUsers?> getUser() async {
    ListAllUsers? user;
    try {
      final userData = await _dio.get(_allUserUrl);
      debugPrint('User Info: ${userData.data}');
      user = ListAllUsers.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    }
    return user;
  }


  Future<OneUserData?> getOneUser(int userId) async {
    OneUserData? user;
    try {
      final userData = await _dio.get("$_allUserUrl/$userId");
      debugPrint('User Info: ${userData.data}');
      user = OneUserData.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    }
    return user;
  }


  // Future<List<ListAllUsers>?> getUser() async {
  //   List<ListAllUsers>? user;
  //   try {
  //     final responseServer = await _dio.get(_allUserUrl);
  //     if(responseServer.statusCode ==200){
  //       var user = (responseServer.data as List).map((e) => ListAllUsers.fromJson(e)).toList();
  //       // var listUsers = user.map((e) => ListAllUsers.fromJson(e).toList());
  //       debugPrint('User Info: ${user.first.toString()}');
  //       return user;
  //     }
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       debugPrint('Dio error!');
  //       debugPrint('STATUS: ${e.response?.statusCode}');
  //       debugPrint('DATA: ${e.response?.data}');
  //       debugPrint('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       debugPrint('Error sending request!');
  //       debugPrint(e.message);
  //     }
  //   }
  //   return user;
  // }

}
