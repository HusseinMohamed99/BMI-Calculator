part of './../../core/helpers/export_manager/export_manager.dart';

class CustomButtonCalculatorWidget extends StatelessWidget {
  const CustomButtonCalculatorWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    var bmiCategory = bmiCubit.getBmiCategory(bmiCubit.result);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorManager.greenColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      alignment: Alignment.center,
      height: 50.h,
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
                bmiValue: bmiCubit.result,
                bmiCategory: bmiCategory['category'] as String,
                bmiCategoryColor: bmiCategory['color'] as Color,
                bmiInterpretation: bmiCategory['bmiInterpretation'] as String,
              ),
            ),
          );
        },
        child: Text(
          'CALCULATOR',
          textAlign: TextAlign.center,
          style: buildTextStyle(fontSize: 20, context: context),
        ),
      ),
    );
  }
}
