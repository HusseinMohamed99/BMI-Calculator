part of './../export_manager/export_manager.dart';

TextStyle buildTextStyle({
  required double fontSize,
  required BuildContext context,
  double? letterSpacing,
}) {
  return TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(context, fontSize: fontSize.sp),
    fontWeight: FontWeight.w600,
    letterSpacing: letterSpacing,
  );
}
