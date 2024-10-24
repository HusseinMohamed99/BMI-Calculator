import 'dart:developer';
import 'dart:io';

import 'package:bmi_calculator/core/helpers/export_manager/export_manager.dart';
import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/modules/bmi_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  if (kReleaseMode) {
    try {
      await requestReview();
    } catch (e) {
      log('Error requesting review: $e');
    }
  }
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }

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
          return MaterialApp(
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
              ),
            ),
            home: const BmiScreen(),
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
  } else {
    goToApplicationOnPlayStore();
  }
}

Future<void> goToApplicationOnPlayStore() async {
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    String url = 'https://play.google.com/store/apps/details?id=$packageName';

    if (Platform.isAndroid &&
        !await launchUrl(Uri.parse(url),
            mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    log('Error launching URL: $e');
  }
}
