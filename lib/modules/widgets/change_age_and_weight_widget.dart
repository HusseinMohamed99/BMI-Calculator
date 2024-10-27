part of './../../core/helpers/export_manager/export_manager.dart';

class ChangeAgeAndWeightWidget extends StatelessWidget {
  const ChangeAgeAndWeightWidget({
    super.key,
    required this.bmiCubit,
    required this.title,
    required this.value,
    required this.inCrement,
    required this.deCrement,
  });

  final BmiCubit bmiCubit;
  final String title;
  final String value;
  final VoidCallback inCrement;
  final VoidCallback deCrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        color: ColorManager.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: ColorManager.blackColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: buildTextStyle(fontSize: 25, context: context),
              ),
              Text(
                value,
                style: buildTextStyle(fontSize: 35, context: context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: deCrement,
                    icon: CircleAvatar(
                      backgroundColor: ColorManager.blueColor,
                      child: Icon(
                        Icons.remove,
                        color: ColorManager.whiteColor,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: inCrement,
                    icon: CircleAvatar(
                      backgroundColor: ColorManager.blueColor,
                      child: Icon(
                        Icons.add,
                        color: ColorManager.whiteColor,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
