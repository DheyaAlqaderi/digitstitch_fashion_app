import 'package:digitstitch_app/features/digitstitch/data/repository/digitstitch_repository_imp.dart';
import 'package:digitstitch_app/features/digitstitch/domain/usecases/get_category.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_bloc.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_event.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/pages/splash_screen/splash_screen.dart';
import 'package:digitstitch_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/theme.dart';

Future<void> main() async {
  // initialize dependencies
  await initializeDependencies();

  // this to make battery, notification icons fixable changes colors above the appbar.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCategoryBloc>(
      create: (context)
      => BlocProvider.of<RemoteCategoryBloc>(context)..add(GetCategories()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DigitStitch',
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      ),
    );
  }
}
