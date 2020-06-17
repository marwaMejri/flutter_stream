import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterstream/utils/bad_request_exception.dart';
import 'package:flutterstream/utils/fetch_data_exception.dart';
import 'package:flutterstream/utils/invalid_input_exception.dart';
import 'package:flutterstream/utils/unauthorised_exception.dart';
import 'package:http/http.dart' as http;

class BaseService {

  @protected
  Future<dynamic> getWS({
    @required String uri,
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    var responseJson;
    try {
      String _url = 'https://jsonplaceholder.typicode.com/$uri';
      if (params.isNotEmpty) {
        _url += '?';
        params.forEach((key, value) {
          _url += '$key=$value&';
        });
        _url = _url.substring(0, _url.length - 2);
      }
      http.Response response =
          await http.get(_url, headers: headers);
      responseJson = _returnResponse(response);
    }
    on SocketException {
      throw FetchDataException("No internet connection");
    }

//    on TimeoutException {
//      throw FetchDataException("Time out exception");
//    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw InvalidInputException(response.body.toString());
      case 500:
        throw FetchDataException("server Error");
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
