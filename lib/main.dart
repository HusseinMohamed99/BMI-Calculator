part of './core/helpers/export_manager/export_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  if (kReleaseMode) {
    await requestReview();
  }
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'BMI Calculator',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: ColorManager.backgroundColor,
              appBarTheme: AppBarTheme(
                backgroundColor: ColorManager.backgroundColor,
                centerTitle: true,
                titleTextStyle: buildTextStyle(
                  context: context,
                  fontSize: 25,
                  letterSpacing: 6,
                ),
              ),
            ),
            home: const BmiScreen(),
          );
        },
      ),
    );
  }
}

Future<void> requestReview() async {
  final InAppReview inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
  } else {
    goToApplicationOnPlayStore();
  }
}

goToApplicationOnPlayStore() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String url = '';
  String packageName = packageInfo.packageName;
  if (Platform.isAndroid) {
    url = 'https://play.google.com/store/apps/details?id=$packageName';
  } else if (!await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
