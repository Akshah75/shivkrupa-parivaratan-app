import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app_exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    print(url);
    dynamic responseJson;
    try {
      Response response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //handaling responeses
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExcption(response.body.toString());
      case 404:
        throw UnAuthrisedException(response.body.toString());
      case 500:
        throw UnAuthrisedException(response.body.toString());
      default:
        dynamic responeseJson = jsonDecode(response.body);
        return responeseJson;
    }
  }

  @override
  Future getPostResponses(String url, data, String token) async {
    dynamic responseJson;
    try {
      Response response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print(data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostResponseForSearch(
    String url,
    String token,
  ) async {
    dynamic responseJson;
    try {
      Response response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
