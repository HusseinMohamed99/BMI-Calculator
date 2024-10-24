part of './../../core/helpers/export_manager/export_manager.dart';

class CustomGenderWidget extends StatelessWidget {
  const CustomGenderWidget({
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
          Expanded(
            child: SelectGenderWidget(
              isMale: bmiCubit.isMale,
              bmiCubit: bmiCubit,
              voidCallback: () {
                bmiCubit.changeGender(buttonName: 'Male');
              },
              image: Assets.imagesMale,
              title: 'MALE',
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: SelectGenderWidget(
              isMale: bmiCubit.isFemale,
              bmiCubit: bmiCubit,
              voidCallback: () {
                bmiCubit.changeGender(buttonName: 'Female');
              },
              image: Assets.imagesFemale,
              title: 'FEMALE',
            ),
          ),
        ],
      ),
    );
  }
}
