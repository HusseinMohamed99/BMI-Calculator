part of './../../core/helpers/export_manager/export_manager.dart';

class CustomGenderWidget extends StatelessWidget {
  const CustomGenderWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                bmiCubit.changeGender(buttonName: 'Male');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  color: bmiCubit.isMale == true ? Colors.green : Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesMale,
                      width: 90.w,
                      height: 90.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcATop,
                      ),
                    ),
                    Text(
                      'MALE',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: InkWell(
              onTap: () {
                bmiCubit.changeGender(buttonName: 'Female');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ).r,
                  color: bmiCubit.isFemale == true ? Colors.red : Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesFemale,
                      width: 90.w,
                      height: 90.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcATop,
                      ),
                    ),
                    Text(
                      'FEMALE',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
