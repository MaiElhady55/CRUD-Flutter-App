import 'package:dio/dio.dart';
import 'package:rise_up_task/core/network/api_constance.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization": "Bearer ${ApiConstance.accessToken}",
          "Accept": "application/json",
          "Content-Type": "application/json"
        }));
  }

  static Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(endPoint);
    return response;
  }

  static Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> data}) async {
    Response response = await dio.post(endPoint, data: data);
    return response;
  }

    static Future<Response> patchData(
      {required String endPoint, required Map<String, dynamic> data}) async {
    Response response = await dio.patch(endPoint, data: data);
    return response;
  }

    static Future<void> deleteData({required String endPoint}) async {
     await dio.delete(endPoint);
  }
}
