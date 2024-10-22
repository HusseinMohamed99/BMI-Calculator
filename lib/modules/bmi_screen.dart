import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:bmi_calculator/generated/assets.dart';
import 'package:bmi_calculator/modules/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiState>(
      listener: (context, state) {},
      builder: (context, state) {
        BmiCubit bmiCubit = BmiCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'BMI Calculator',
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            bmiCubit.changeGender(buttonName: 'Male');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              color: bmiCubit.isMale == true
                                  ? Colors.green
                                  : Colors.grey,
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
                        child: InkWell(
                          onTap: () {
                            bmiCubit.changeGender(buttonName: 'Female');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ).r,
                              color: bmiCubit.isFemale == true
                                  ? Colors.red
                                  : Colors.grey,
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
                flex: 2,
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
                              '${bmiCubit.height.round()}',
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
                          value: bmiCubit.height,
                          min: 70,
                          max: 250,
                          onChanged: (value) {
                            bmiCubit.height = value;
                            bmiCubit.changeHeight();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
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
                                '${bmiCubit.age}',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bmiCubit.decrement(button: 'age');
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      bmiCubit.increment(button: 'age');
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
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
                                '${bmiCubit.weight}',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bmiCubit.decrement(button: 'weight');
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      bmiCubit.increment(button: 'weight');
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
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
                alignment: Alignment.center,
                height: 50.h,
                color: const Color(0xFF000000),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    bmiCubit.calculateBMI();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResultScreen(
                          isMale: bmiCubit.isMale,
                          age: bmiCubit.age,
                          result: bmiCubit.result.round(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'CALCULATOR',
                    textAlign: TextAlign.center,
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
      },
    );
  }
}
