
import 'package:digitstitch_app/features/digitstitch/auth/data/data_source/auth_service_api.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/login/login_response.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_request.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/models/signup/signup_response.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthServiceApi _authServiceApi;

  AuthRepositoryImpl(this._authServiceApi);

  @override
  Future<LoginResponseModel> login(String emailOrPhone, String password) async{
    try{
      final response = await _authServiceApi.login(emailOrPhone, password);
      if(response != null){
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<SignupResponseModel> signup(SignUpRequestModel signUpRequestModel) {
    // TODO: implement signup
    throw UnimplementedError();
  }

}