import 'dart:async';

import 'package:http_demo/src/bloc/validator.dart';

class Bloc extends Object with Validator{

  final _email=StreamController<String>();
  final _password=StreamController<String>();



//add data to stream
Stream<String> get email=>_email.stream.transform(validateEmail);
Stream<String> get password=>_password.stream.transform(validatePassword);

//change data
Function(String) get changeEmail=>_email.sink.add;
Function(String) get changePassword=>_password.sink.add;

dispose(){
_email.close();
_password.close();
}
}
