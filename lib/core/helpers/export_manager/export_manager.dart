import 'dart:io';

import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/assets.dart';
import '../../../modules/bmi_result_screen.dart';
import '../../../modules/bmi_screen.dart';

part './../../../main.dart';
part './../../../modules/widgets/custom_age_and_weight.dart';
part './../../../modules/widgets/custom_button_calculator.dart';
part './../../../modules/widgets/custom_gender.dart';
part './../../../modules/widgets/custom_height.dart';
part './../responsive/font_size.dart';
part './../style/color_manager.dart';
part './../style/text_style.dart';
