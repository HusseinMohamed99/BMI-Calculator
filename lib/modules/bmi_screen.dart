import 'package:bmi_calculator/core/helpers/export_manager/export_manager.dart';
import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForUpdate(context);
    });
  }

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
          body: Column(
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
        );
      },
    );
  }

  Future<void> checkForUpdate(BuildContext context) async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    // Set the Remote Config fetch settings
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    try {
      // Fetch and activate the remote config
      await remoteConfig.fetchAndActivate();

      // Get the remote version from Remote Config
      final latestVersion = remoteConfig.getString('latest_version');

      // Log the latest version to check if it's fetched correctly
      if (kDebugMode) {
        print('Latest version fetched: $latestVersion');
      }

      // Get the current app version
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      // Log the current version
      if (kDebugMode) {
        print('Current app version: $currentVersion');
      }

      // Check if the app needs to be updated
      if (_isVersionOlder(currentVersion, latestVersion)) {
        await showUpdateDialog(context);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching remote config: $e');
      }
    }
  }

  bool _isVersionOlder(String remoteVersion, String currentVersion) {
    // Split the versions and parse each part as an integer
    List<int> remoteParts = remoteVersion
        .split('.')
        .map((part) => int.tryParse(part) ?? 0)
        .toList();
    List<int> currentParts = currentVersion
        .split('.')
        .map((part) => int.tryParse(part) ?? 0)
        .toList();

    for (int i = 0; i < remoteParts.length; i++) {
      if (remoteParts[i] > currentParts[i]) {
        return true; // Remote version is newer
      } else if (remoteParts[i] < currentParts[i]) {
        return false; // Current version is up-to-date
      }
    }
    return false; // Versions are the same
  }

  Future<void> showUpdateDialog(BuildContext context) async {
    // Ensure the dialog is shown after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'تحديث جديد متاح',
              style: buildTextStyle(
                context: context,
                fontSize: 16,
                color: ColorManager.blackColor,
              ),
            ),
            content: Text(
              'يوجد إصدار جديد من التطبيق. يُفضل تحديث التطبيق للحصول على أحدث الميزات.',
              style: buildTextStyle(
                context: context,
                fontSize: 16,
                color: ColorManager.blackColor,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'لاحقًا',
                  style: buildTextStyle(
                    context: context,
                    fontSize: 16,
                    color: ColorManager.redColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'تحديث الآن',
                  style: buildTextStyle(
                    context: context,
                    fontSize: 16,
                    color: ColorManager.greenColor,
                  ),
                ),
                onPressed: () {
                  _launchURL(
                      'https://play.google.com/store/apps/details?id=com.example.your_app_id');
                },
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> _launchURL(String url) async {
    !await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    {
      throw Exception('لا يمكن فتح الرابط $url');
    }
  }
}
