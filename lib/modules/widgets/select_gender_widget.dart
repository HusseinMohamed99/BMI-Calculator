part of './../../core/helpers/export_manager/export_manager.dart';

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
          color:
              isMale == true ? ColorManager.greenColor : ColorManager.greyColor,
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
