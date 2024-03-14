
import 'package:digitstitch_app/features/digitstitch/auth/presentation/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/usecase/login_usecase/login_usecase.dart';

import '../../../../../../core/helper/shareprefrence_manager.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(InitLoginState());

  Future<void> login(String phoneOrEmail, String password) async {
    // Emit loading state
    emit(LoadingLoginState());
    try {
      // Perform login operation
      final response = await _loginUseCase.login(phoneOrEmail, password);
      // Emit success state with response data
      emit(SuccessLoginState(response));
      // Save token to shared preferences
      await _saveToken(response.token.toString());
    } catch (e) {
      // Emit error state with error message
      emit(ErrorLoginState(e.toString()));
    }
  }

  Future<void> _saveToken(String token) async {
    try {
      // Save token to shared preferences
      await SharedPrefManager.saveData('token', token);
    } catch (e) {
      // Handle error while saving token
      print('Error saving token: $e');
      // You can choose to emit an error state here if needed
    }
  }
}