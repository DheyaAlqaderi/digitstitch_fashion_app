import 'package:digitstitch_app/features/digitstitch/auth/data/models/login/login_response.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/repository/auth_repository.dart';


class LoginUseCase{
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

 Future<LoginResponseModel> login(String phoneOrEmail, String password) {
   return  _authRepository.login(phoneOrEmail, password);
 }

}