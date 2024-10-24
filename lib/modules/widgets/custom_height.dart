part of './../../core/helpers/export_manager/export_manager.dart';

class CustomHeightWidget extends StatelessWidget {
  const CustomHeightWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
