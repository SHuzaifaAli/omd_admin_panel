import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:omd_admin_panel/Constants/api_constants.dart';
import 'package:omd_admin_panel/Model/Response/OrderListModels/list_all_orders.dart';
import 'package:omd_admin_panel/Model/Response/OrderListModels/one_order.dart' as ONEORDER;
import 'package:omd_admin_panel/Services/Services.dart';

class OrderDataProvider{
  final  _allOderList = ApiConstants.listAllOrders;
  // final Dio _dio = Dio(
  //   BaseOptions(baseUrl: ApiConstants.baseUrl,
  //   receiveTimeout: 3000,
  //   connectTimeout: 5000,
  //   responseType: ResponseType.json),
  // );

  final dio = Services().dioHelper();
  Future<ListAllOrders?> getOrder() async {
    ListAllOrders? order;
    try {
      final orderData = await dio.get(_allOderList);
      debugPrint('order Info: ${orderData.data}');
      order = ListAllOrders.fromJson(orderData.data);
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
    return order;
  }



  Future<List<ONEORDER.Response>?> getOneOrder(String orderId) async {
    ONEORDER.OneOrder? oneOrder;
    List<ONEORDER.Response>? listingOrder;
    try {
      final oneOrderData = await dio.get("$_allOderList/$orderId");
      debugPrint('User Info: ${oneOrderData.data}');
      oneOrder = ONEORDER.OneOrder.fromJson(oneOrderData.data);
      listingOrder = oneOrder.response;
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
    return listingOrder;
  }
// void getActiveBannerResponseStageHall(BuildContext context,
//       DialogCodeListener dialogCodeListener, int exhibition_id) async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       Factory().showAlertDialog(context,"Info", "No Connectivity,\nCheck your connection and try again");
//       return;
//     }
//     dialogCodeListener.onShow();
//
//     final prefs = await SharedPreferences.getInstance();
//     final userLogin = PreferencesService().getLoginResponse(prefs);
//     var dio = Dio(Factory().getDioOption(userLogin!.authTOKEN!));
//     final response = await dio.request(
//       'exhibition/getExhibitionBanners/$exhibition_id',
//       options: Options(
//         method: "GET",
//       ),
//     );
//     try {
//       if (response.statusCode == 200) {
//         GetExhibionBannersResponse? res =
//             GetExhibionBannersResponse.fromJson(response.data);
//         if (res.code == 1) {
//           dialogCodeListener.onHide(ConstantManager.ACTIVE_BANNER_SUCCESS,
//               res.message, res.response!);
//         } else {
//           dialogCodeListener.onHide(
//               ConstantManager.ACTIVE_BANNER_UNSUCCESS, res.message, Null);
//         }
//       } else {
//         // then throw an exception.
//         dialogCodeListener.onDismiss("error");
//         print("${response.statusMessage}");
//         throw Exception('Failed to create.${response.statusMessage!}');
//       }
//     } catch (e) {
//       dialogCodeListener.onDismiss("${e.toString()}");
//       throw Exception('Failed to get with ${e.toString()}');
//     }
//   }


}