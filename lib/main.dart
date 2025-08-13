import 'package:e_commerce/core/configs/theme/app_theme.dart';
import 'package:e_commerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce/presentation/splash/pages/splash.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp, 
      ]).then((_) {
  
  runApp(const MyApp());
});}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 740),
      builder:
          (context, child) => BlocProvider(
            create: (context) => SplashCubit()..appStarted(),
            child: MaterialApp(
              theme: AppTheme.appTheme,
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
            ),
          ),
    );
  }
}
