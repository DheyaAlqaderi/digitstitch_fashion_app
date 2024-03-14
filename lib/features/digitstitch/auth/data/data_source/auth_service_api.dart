
import 'package:digitstitch_app/features/digitstitch/auth/data/models/login/login_response.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_request.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';

part 'auth_service_api.g.dart';

@RestApi(baseUrl: DigitstitchApiBaseUrl)
abstract class AuthServiceApi{
  factory AuthServiceApi(Dio dio, {String baseUrl}) = _AuthServiceApi;

  @POST('auth/login')
  Future<LoginResponseModel> login(
      @Field("email_or_phone") String emailOrPhone,
      @Field("password") String password,
      );


  @POST('auth/signup/')
  Future<SignupResponseModel> createAccount(
      @Body() SignUpRequestModel signUpRequestModel
      );
}