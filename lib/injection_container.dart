import 'package:digitstitch_app/features/digitstitch/data/repository/digitstitch_repository_imp.dart';
import 'package:digitstitch_app/features/digitstitch/domain/usecases/get_category.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/digitstitch/domain/repository/digitstitch_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<DigitstitchRepository>(
    DigitstitchRepositoryImp(sl())
  );

  // Usecases
  sl.registerSingleton<GetCategoryUsecase>(
    GetCategoryUsecase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteCategoryBloc>(
      ()=> RemoteCategoryBloc(sl())
  );

}