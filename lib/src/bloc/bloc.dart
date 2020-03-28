import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator{

  final _email=BehaviorSubject<String>();
  final _password=BehaviorSubject<String>();



//add data to stream
Stream<String> get email=>_email.stream.transform(validateEmail);
Stream<String> get password=>_password.stream.transform(validatePassword);
Stream<bool> get submitValue=> Observable.combineLatest2(email,password,(e,p)=>true); //observable
//change data
Function(String) get changeEmail=>_email.sink.add;
Function(String) get changePassword=>_password.sink.add;

submit(){
final validEmail=_email.value;
final validPassword=_password.value;
print('email is: $validEmail');
print('password is: $validPassword');
}
dispose(){
_email.close();
_password.close();
}
}
