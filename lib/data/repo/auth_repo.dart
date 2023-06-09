import 'package:parivartan_app/data/network/network_api_services.dart';

import '../network/base_api_services.dart';
import '../url/app_url.dart';

class AuthRepo {
  BaseApiServices apiServices = NetworkApiServices();
  //
  Future<dynamic> loginApi(dynamic data) async {
    print(data);
    try {
      dynamic response =
          await apiServices.getPostResponse(AppUrl.loginUrl, data);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> searchApi(dynamic data, String token) async {
    print(data);
    try {
      dynamic response =
          await apiServices.getPostResponses(AppUrl.searchUrl, data, token);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> exportApi(dynamic data, String token) async {
    print(data);
    try {
      dynamic response =
          await apiServices.getPostResponses(AppUrl.exportUrl, data, token);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> logout() async {
    try {
      dynamic response = await apiServices.getGetResponse(
        AppUrl.logOutUrl,
      );
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
