import 'dart:math';

import 'package:bmi_calculator/core/helpers/constant/constant.dart';
import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:bmi_calculator/generated/assets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

part './../../../cubit/bmi_cubit.dart';
part './../../../modules/bmi_result_screen.dart';
part './../../../modules/bmi_screen.dart';
part './../../../modules/widgets/change_age_and_weight_widget.dart';
part './../../../modules/widgets/custom_age_and_weight.dart';
part './../../../modules/widgets/custom_button_calculator.dart';
part './../../../modules/widgets/custom_gender.dart';
part './../../../modules/widgets/custom_height.dart';
part './../../../modules/widgets/custom_result_text.dart';
part './../../../modules/widgets/select_gender_widget.dart';
part './../responsive/font_size.dart';
part './../style/color_manager.dart';
part './../style/text_style.dart';
