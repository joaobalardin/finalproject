import 'package:finalproject/app/model/user.dart';

class LoggedUser{
  static final LoggedUser _singleton = LoggedUser._internal();

  User user;

  factory LoggedUser() {
    return _singleton;
  }

  LoggedUser._internal();
}