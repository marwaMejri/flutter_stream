import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseService{

  @protected
  Future getWS({
    @required String uri,
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    try {
      String _url = 'https://jsonplaceholder.typicode.com/$uri';
      if (params.isNotEmpty) {
        _url += '?';
        params.forEach((key, value) {
          _url += '$key=$value&';
        });
        _url = _url.substring(0, _url.length - 2);
      }
      http.Response response = await http.get(_url, headers: headers).timeout(Duration(seconds: 30));
      return response.statusCode >= 200 && response.statusCode < 300
          ?response
          :throw Exception('Failed to load post');
    } on TimeoutException catch (timeOutExceptionError) {
      print(timeOutExceptionError);
    } on Exception catch (error) {
      print(error);
    }
  }
}