import 'package:dio/dio.dart';
import 'package:omd_admin_panel/Constants/api_constants.dart';
import 'package:omd_admin_panel/Model/Response/MedicineListModel/list_all_medicine.dart';
import 'package:omd_admin_panel/Model/Response/MedicineListModel/one_medicine.dart';

class MedicineDataProvider {
  final _allMedicineUrl = ApiConstants.listAllMedicine;


  final Dio _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        responseType: ResponseType.json,
      )
  );


  Future<ListAllMedicine?> getMedicine() async {
    ListAllMedicine? user;
    try {
      final userData = await _dio.get(_allMedicineUrl);
      print('Medicine Info: ${userData.data}');
      user = ListAllMedicine.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  Future<OneMedicine?> getOneMedicine(int medicineID) async {
    OneMedicine? user;
    try {
      final userData = await _dio.get("$_allMedicineUrl/$medicineID");
      print('User Info: ${userData.data}');
      user = OneMedicine.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }




}