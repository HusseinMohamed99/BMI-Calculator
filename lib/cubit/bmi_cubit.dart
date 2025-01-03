import 'dart:math';

import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  static BmiCubit get(context) => BlocProvider.of(context);

  int age = 18;
  int weight = 50;
  double height = 120.0;
  double result = 0;
  bool isMale = true;
  bool isFemale = false;
  void calculateBMI() async {
    result = weight / pow(height / 100, 2);
    emit(BmiCalculate(bmi: result));
  }

  void increment({required String button}) {
    if (button == 'age') {
      age++;
      emit(BmiAgeIncrement());
    } else {
      weight++;
      emit(BmiWeightIncrement());
    }
  }

  void decrement({required String button}) {
    if (button == 'age') {
      if (age <= 16) {
        return;
      } else {
        age--;
      }
      emit(BmiAgeDecrement());
    } else {
      if (weight <= 40) {
        return;
      } else {
        weight--;
      }
      emit(BmiWeightDecrement());
    }
  }

  void changeGender({required String buttonName}) {
    if (buttonName == 'Male') {
      isMale = true;
      isFemale = false;
      emit(BmiChangeGender());
    } else {
      isMale = false;
      isFemale = true;
      emit(BmiChangeGender());
    }
  }

  // Method to determine BMI category
  // Method to determine BMI category and color
  Map<String, dynamic> getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return {
        'category': "Underweight",
        'color': Colors.blue,
        'bmiInterpretation': "Try to increase the weight",
      };
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return {
        'category': "Normal",
        'color': Colors.green,
        'bmiInterpretation': "Enjoy, You are fit",
      };
    } else if (bmi >= 25 && bmi < 29.9) {
      return {
        'category': "Overweight",
        'color': Colors.orange,
        'bmiInterpretation': "Do regular exercise & reduce the weight",
      };
    } else {
      return {
        'category': "Obese",
        'color': Colors.red,
        'bmiInterpretation': "Please work to reduce obesity",
      };
    }
  }

  void changeHeight() {
    emit(BmiChangeHeight());
  }
}
