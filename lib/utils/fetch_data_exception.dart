import 'package:flutterstream/utils/app_exception.dart';

class FetchDataException extends AppException {

  FetchDataException([message])
      : super(message, "Error During Communication ");

}