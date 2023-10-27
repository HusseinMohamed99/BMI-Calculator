import 'dart:math';

import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  static BmiCubit get(context) => BlocProvider.of(context);

  int age = 18;
  int weight = 50;
  double height = 120.0;
  double result = 0;
  bool isMale = true;
  bool isFemale = true;

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
      age--;
      emit(BmiAgeDecrement());
    } else {
      weight--;
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

  void changeHeight() {
    emit(BmiChangeHeight());
  }
}
