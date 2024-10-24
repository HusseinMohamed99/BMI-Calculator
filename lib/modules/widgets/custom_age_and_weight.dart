part of './../../core/helpers/export_manager/export_manager.dart';

class CustomAgeAndWeightWidget extends StatelessWidget {
  const CustomAgeAndWeightWidget({
    super.key,
    required this.bmiCubit,
  });

  final BmiCubit bmiCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ).r,
                color: const Color(0xFF000000),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${bmiCubit.age}',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          bmiCubit.decrement(button: 'age');
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          bmiCubit.increment(button: 'age');
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
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
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ).r,
                color: const Color(0xFF000000),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${bmiCubit.weight}',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          bmiCubit.decrement(button: 'weight');
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          bmiCubit.increment(button: 'weight');
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
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
        ],
      ),
    );
  }
}
