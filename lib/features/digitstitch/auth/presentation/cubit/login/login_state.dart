import 'package:digitstitch_app/features/digitstitch/auth/data/models/login/login_response.dart';

abstract class LoginState {}

class InitLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginResponseModel loginResponseModel;
  SuccessLoginState(this.loginResponseModel);
}

class ErrorLoginState extends LoginState {
  String error;
  ErrorLoginState(this.error);
}