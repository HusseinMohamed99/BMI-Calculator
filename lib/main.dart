import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/modules/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                  scaffoldBackgroundColor: const Color(0xff04043A),
                  appBarTheme: AppBarTheme(
                    backgroundColor: const Color(0xff04043A),
                    centerTitle: true,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                    ),
                  )),
              home: const BmiScreen(),
            );
          }),
    );
  }
}
