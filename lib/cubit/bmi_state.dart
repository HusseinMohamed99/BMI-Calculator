abstract class BmiState {}

final class BmiInitial extends BmiState {}

final class BmiAgeIncrement extends BmiState {}

final class BmiAgeDecrement extends BmiState {}

final class BmiWeightIncrement extends BmiState {}

final class BmiWeightDecrement extends BmiState {}

final class BmiCalculate extends BmiState {
  final double bmi;
  BmiCalculate({required this.bmi});
}

final class BmiChangeGender extends BmiState {}

final class BmiChangeHeight extends BmiState {}

final class BmiResultSuccess extends BmiState {}
