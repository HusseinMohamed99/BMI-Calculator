part of './../../core/helpers/export_manager/export_manager.dart';

class CustomAgeAndWeightWidget extends StatelessWidget {
  const CustomAgeAndWeightWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          ChangeAgeAndWeightWidget(
            bmiCubit: bmiCubit,
            title: 'AGE',
            value: '${bmiCubit.age}',
            inCrement: () {
              bmiCubit.increment(button: 'age');
            },
            deCrement: () {
              bmiCubit.decrement(button: 'age');
            },
          ),
          SizedBox(width: 10.w),
          ChangeAgeAndWeightWidget(
            bmiCubit: bmiCubit,
            title: 'WEIGHT',
            value: '${bmiCubit.weight}',
            inCrement: () {
              bmiCubit.increment(button: 'weight');
            },
            deCrement: () {
              bmiCubit.decrement(button: 'weight');
            },
          ),
        ],
      ),
    );
  }
}
