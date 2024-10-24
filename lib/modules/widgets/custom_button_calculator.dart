part of './../../core/helpers/export_manager/export_manager.dart';

class CustomButtonCalculatorWidget extends StatelessWidget {
  const CustomButtonCalculatorWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
