import 'package:flutterstream/utils/app_exception.dart';

class InvalidInputException extends AppException{
  InvalidInputException(message):super(message,"Invalid Input: ");
}