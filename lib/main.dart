import 'dart:developer';

import 'package:bmi_calculator/core/helpers/constant/constant.dart';
import 'package:bmi_calculator/core/helpers/export_manager/export_manager.dart';
import 'package:bmi_calculator/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  await ScreenUtil.ensureScreenSize();
  if (kReleaseMode) {
    try {
      await requestReview();
    } catch (e) {
      log('Error requesting review: $e');
    }
  }

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appName = packageInfo.appName;
  appPackageName = packageInfo.packageName;
  appVersion = packageInfo.version;
  appBuildNumber = packageInfo.buildNumber;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: MaterialApp(
              title: 'BMI Calculator',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: ColorManager.backgroundColor,
                appBarTheme: AppBarTheme(
                  backgroundColor: ColorManager.backgroundColor,
                  centerTitle: true,
                  titleTextStyle: buildTextStyle(
                    context: context,
                    fontSize: 25,
                    letterSpacing: 6,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    systemNavigationBarColor: ColorManager.backgroundColor,
                  ),
                ),
              ),
              home: const BmiScreen(),
            ),
          );
        },
      ),
    );
  }
}

Future<void> requestReview() async {
  final InAppReview inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
  }
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kReleaseMode) {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
