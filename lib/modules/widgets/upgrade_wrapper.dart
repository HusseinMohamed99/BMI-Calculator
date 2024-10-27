part of './../../core/helpers/export_manager/export_manager.dart';

class UpgradeWrapper extends StatelessWidget {
  const UpgradeWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      upgrader: Upgrader(),
      child: child,
    );
  }
}
