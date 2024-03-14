import 'package:digitstitch_app/features/digitstitch/Home/data/data_source/home_page_api_service.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/repository/home_page_repository_impl.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_banners/get_banners_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/banners/banners_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/pages/home/home_page.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/data_source/auth_service_api.dart';
import 'package:digitstitch_app/features/digitstitch/auth/data/repository/auth_repository_impl.dart';
import 'package:digitstitch_app/features/digitstitch/auth/domain/usecase/login_usecase/login_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/cubit/login/login_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/root/presentation/pages/root.dart';
import 'package:digitstitch_app/features/digitstitch/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/theme.dart';
import 'package:dio/dio.dart';

import 'core/helper/shareprefrence_manager.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPrefManager.init();


  // this to make battery, notification icons fixable changes colors above the appbar.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),);

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(LoginUseCase(AuthRepositoryImpl(AuthServiceApi(Dio())))),
        ),
        BlocProvider<BannerCubit>(
          create: (_) => BannerCubit(GetBannersUseCase(HomePageRepositoryImpl(HomePageApi(Dio())))),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DigitStitch',
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.system,
        home: SplashPage(),
      ),
    );
  }
}
