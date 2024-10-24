part of './../export_manager/export_manager.dart';
// Scale Factor
// Responsive Font Size
// (min , max) Font Size

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  // log(
  //   'Base font Size =  $fontSize, lowerLimit = $lowerLimit, upperLimit = $upperLimit, responsiveFontSize = $responsiveFontSize,final font size = ${responsiveFontSize.clamp(lowerLimit, upperLimit)}, scaleFactor = $scaleFactor',
  // );
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
