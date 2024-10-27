part of './../../core/helpers/export_manager/export_manager.dart';

class CustomHeightWidget extends StatelessWidget {
  const CustomHeightWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10).r,
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          color: ColorManager.blackColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: buildTextStyle(fontSize: 30, context: context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${bmiCubit.height.round()}',
                  style: buildTextStyle(fontSize: 35, context: context),
                ),
                SizedBox(width: 10.w),
                Text(
                  'CM',
                  style: buildTextStyle(fontSize: 16, context: context),
                ),
              ],
            ),
            Slider(
              thumbColor: ColorManager.redColor,
              activeColor: ColorManager.blueColor,
              inactiveColor: ColorManager.whiteColor,
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
