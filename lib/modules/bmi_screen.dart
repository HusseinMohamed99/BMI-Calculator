import 'package:bmi_calculator/core/helpers/export_manager/export_manager.dart';
import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiState>(
      listener: (context, state) {},
      builder: (context, state) {
        BmiCubit bmiCubit = BmiCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'BMI Calculator',
              style: buildTextStyle(fontSize: 16, context: context),
            ),
          ),
          body: UpgradeWrapper(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomGenderWidget(bmiCubit: bmiCubit),
                ),
                Expanded(
                  flex: 2,
                  child: CustomHeightWidget(bmiCubit: bmiCubit),
                ),
                Expanded(
                  flex: 2,
                  child: CustomAgeAndWeightWidget(bmiCubit: bmiCubit),
                ),
                CustomButtonCalculatorWidget(bmiCubit: bmiCubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
