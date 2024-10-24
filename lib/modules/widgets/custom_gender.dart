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

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
    required this.bmiCubit,
    required this.voidCallback,
    required this.image,
    required this.title,
    required this.isMale,
  });

  final BmiCubit bmiCubit;
  final VoidCallback voidCallback;
  final String image;
  final String title;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          color: isMale == true ? Colors.green : Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 90.w,
              height: 90.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
            ),
            Text(
              title,
              style: buildTextStyle(fontSize: 20, context: context),
            ),
          ],
        ),
      ),
    );
  }
}
