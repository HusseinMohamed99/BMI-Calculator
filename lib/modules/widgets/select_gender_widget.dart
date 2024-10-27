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
      child: Card(
        elevation: 5,
        color:
            isMale == true ? ColorManager.greenColor : ColorManager.greyColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: isMale == true
                ? ColorManager.greenColor
                : ColorManager.greyColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 90.w,
                height: 90.h,
              ),
              Text(
                title,
                style: buildTextStyle(fontSize: 20, context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
