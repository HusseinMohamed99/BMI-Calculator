import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  const BMIResultScreen({
    Key? key,
    required this.result,
    required this.age,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04043A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: Text(
          'BMI Result',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0).r,
          child: Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ).r,
              color: const Color(0xFF000000),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Result : $result ',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      'BMI ',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10).r,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2).r,
                      color: Colors.blue,
                    ),
                    height: 5.h,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Gender : ${isMale ? 'Male' : 'Female'} ',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(10).r,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2).r,
                      color: Colors.blue,
                    ),
                    height: 5.h,
                    width: double.infinity,
                  ),
                ),
                Text(
                  'Age : $age ',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (result >= 16 && result <= 18.5)
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.all(10).r,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2).r,
                            color: Colors.blue,
                          ),
                          height: 5.h,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        'UnderWeight ',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (result >= 18.5 && result <= 25.0)
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.all(10).r,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2).r,
                            color: Colors.blue,
                          ),
                          height: 5.h,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        'Normal ',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (result >= 25.0 && result <= 40)
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.all(10).r,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2).r,
                            color: Colors.blue,
                          ),
                          height: 5.h,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        'OVER Weight ',
                        style: GoogleFonts.roboto(
                          color: Colors.red,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
