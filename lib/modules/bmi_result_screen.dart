// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './../core/helpers/export_manager/export_manager.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmiValue;
  final bool isMale;
  final int age;
  final String bmiCategory;

  const BMIResultScreen({
    super.key,
    required this.bmiValue,
    required this.isMale,
    required this.age,
    required this.bmiCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'BMI Result',
              style: buildTextStyle(fontSize: 20, context: context),
            ),
          ),
          body: Center(
            child: Card(
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // margin: const EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Radial Gauge for BMI Value
                    SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 10,
                          maximum: 40,
                          axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.2,
                            cornerStyle: CornerStyle.bothCurve,
                            color: const Color(0x1E00A9B5),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          ranges: [
                            ...gaugeRange(context),
                          ],
                          pointers: gaugePointer,
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Text(
                                bmiValue.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.7,
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomResult(result: bmiValue),
                    CustomDivider(),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomResultText(
                      title: 'Gender : ${isMale ? 'Male' : 'Female'}',
                      fontSize: 25,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomDivider(),
                    CustomResultText(title: 'Age : $age', fontSize: 25),
                    SizedBox(height: 5.h),
                    CustomDivider(),
                    if (bmiValue >= 16 && bmiValue <= 18.5)
                      CustomResultText(title: 'Under Weight', fontSize: 25)
                    else if (bmiValue >= 18.5 && bmiValue <= 25.0)
                      CustomResultText(title: 'Normal', fontSize: 25)
                    else
                      CustomResultText(
                        title: bmiCategory,
                        color: ColorManager.redColor,
                        fontSize: 25,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<GaugePointer> get gaugePointer {
    return <GaugePointer>[
      NeedlePointer(
        value: bmiValue,
        needleColor: Colors.blueAccent,
        needleLength: 0.8,
        needleStartWidth: 1,
        needleEndWidth: 4,
      )
    ];
  }

  List<GaugeRange> gaugeRange(BuildContext context) {
    return <GaugeRange>[
      GaugeRange(
        startValue: 10,
        endValue: 18.5,
        color: ColorManager.blueColor,
        startWidth: 20,
        endWidth: 20,
      ),
      GaugeRange(
        startValue: 18.5,
        endValue: 24.9,
        color: ColorManager.greenColor,
        startWidth: 20,
        endWidth: 20,
      ),
      GaugeRange(
        startValue: 25,
        endValue: 29.9,
        color: ColorManager.orangeColor,
        startWidth: 20,
        endWidth: 20,
      ),
      GaugeRange(
        startValue: 30,
        endValue: 40,
        color: ColorManager.redColor,
        startWidth: 20,
        endWidth: 20,
      ),
    ];
  }

  // void setBmiInterpretation() {
  //   if (result > 30) {
  //     bmiStatus = "Obese";
  //     bmiInterpretation = "Please work to reduce obesity";
  //     bmiStatusColor = Colors.pink;
  //   } else if (result >= 25) {
  //     bmiStatus = "Overweight";
  //     bmiInterpretation = "Do regular exercise & reduce the weight";
  //     bmiStatusColor = Colors.orange;
  //   } else if (result >= 18.5) {
  //     bmiStatus = "Normal";
  //     bmiInterpretation = "Enjoy, You are fit";
  //     bmiStatusColor = Colors.green;
  //   } else if (result < 18.5) {
  //     bmiStatus = "Underweight";
  //     bmiInterpretation = "Try to increase the weight";
  //     bmiStatusColor = Colors.red;
  //   }
  // }
}

class CustomResult extends StatelessWidget {
  const CustomResult({
    super.key,
    required this.result,
  });

  final double result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        CustomResultText(
            title: 'Result : ${result.toStringAsFixed(1)}', fontSize: 25),
        SizedBox(width: 1.w),
        CustomResultText(title: 'BMI', fontSize: 16),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).r,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2).r,
          color: Colors.blue,
        ),
        height: 2.h,
        width: double.infinity,
      ),
    );
  }
}

class CustomResultText extends StatelessWidget {
  const CustomResultText({
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
// Color color1 = HexColor("b74093");
// Color color2 = HexColor("#b74093");
// Color color3 = HexColor("#88b74093");
