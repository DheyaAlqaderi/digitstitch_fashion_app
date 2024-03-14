import 'package:digitstitch_app/features/digitstitch/auth/data/data_source/auth_service_api.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/repository/auth_repository_impl.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/repository/auth_repository.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/usecase/login_usecase/login_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/cubit/login/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Initialize GetIt for dependency injection
final sl = GetIt.instance;

// Register  dependencies
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // ApiService
  sl.registerSingleton<AuthServiceApi>(AuthServiceApi(sl.get<Dio>()));

  // RepositoryImp
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl.get<AuthServiceApi>()));

  // GetCategoryUseCase
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl.get<AuthRepository>()));

  // CategoryBloc
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
}