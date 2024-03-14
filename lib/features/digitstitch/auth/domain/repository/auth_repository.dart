
import 'package:digitstitch_app/features/digitstitch/auth/data/models/login/login_response.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_request.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_response.dart';

abstract class AuthRepository{

  // auth
  Future<LoginResponseModel> login(String email_or_phone, String password);
  Future<SignupResponseModel> signup(SignUpRequestModel signUpRequestModel);
}