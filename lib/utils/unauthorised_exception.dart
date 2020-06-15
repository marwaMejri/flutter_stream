import 'package:flutterstream/utils/app_exception.dart';

class UnauthorisedException extends AppException{

  UnauthorisedException( message):super(message,"Unauthorised: ");
}