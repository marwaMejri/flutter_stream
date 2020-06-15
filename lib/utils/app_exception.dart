class AppException implements Exception{

  final _responseError;
  final _message;

  AppException([this._responseError, this._message]);


  String toString(){
    return "$_responseError:$_message";
  }

}