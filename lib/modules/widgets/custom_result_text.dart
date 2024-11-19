part of './../../core/helpers/export_manager/export_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.fontSize,
    this.color,
  });
  final String title;
  final double fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: buildTextStyle(
        fontSize: fontSize,
        context: context,
        color: color ?? ColorManager.whiteColor,
      ),
    );
  }
}
