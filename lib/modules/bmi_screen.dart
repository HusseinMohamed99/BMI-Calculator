import 'dart:math';

import 'package:bmi_calculator/generated/assets.dart';
import 'package:bmi_calculator/modules/bmi_result_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120.0;
  int age = 18;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04043A),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff04043A),
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          color: !isMale
                              ? const Color(0xFF000000)
                              : const Color(0xff004a86),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.imagesMale,
                              width: 90.w,
                              height: 90.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcATop,
                              ),
                            ),
                            Text(
                              'MALE',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ).r,
                          color: !isMale
                              ? const Color(0xff004a86)
                              : const Color(0xFF000000),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.imagesFemale,
                              width: 90.w,
                              height: 90.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcATop,
                              ),
                            ),
                            Text(
                              'FEMALE',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ).r,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  color: const Color(0xFF000000),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'CM',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      thumbColor: Colors.red,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.white,
                      value: height,
                      min: 70,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ).r,
                        color: const Color(0xFF000000),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$age',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ).r,
                        color: const Color(0xFF000000),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF000000),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);

                if (kDebugMode) {
                  print(result.round());
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      isMale: isMale,
                      age: age,
                      result: result.round(),
                    ),
                  ),
                );
              },
              height: 60.0,
              child: Text(
                'CALCULATOR',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
