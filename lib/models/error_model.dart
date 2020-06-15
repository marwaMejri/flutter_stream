import 'package:flutter/cupertino.dart';

class ErrorModel {
  final String description;
  final int statusCode;

  ErrorModel({
    @required this.description,
    @required this.statusCode,
  });
}
