import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  const BMIResultScreen({Key? key,
    required this.result,
    required this.age,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#04043A'),
      appBar: AppBar(
        backgroundColor: HexColor('#800080'),
        title: const Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: HexColor('#800080'),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Result : $result ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 1.0,
                    ),
                    const Text(
                      'BMI ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        2.0,
                      ),
                      color: Colors.blue,
                    ),
                    height: 5.0,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Gender : ${isMale ? 'Male' : 'Female'} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        2.0,
                      ),
                      color: Colors.blue,
                    ),
                    height: 5.0,
                    width: double.infinity,
                  ),
                ),
                Text(
                  'Age : $age ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (result >= 16 && result <= 18.5)
                  Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              2.0,
                            ),
                            color: Colors.blue,
                          ),
                          height: 5.0,
                          width: double.infinity,
                        ),
                      ),
                      const Text(
                        'UnderWeight ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (result >= 18.5 && result <= 25.0)
                  Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              2.0,
                            ),
                            color: Colors.blue,
                          ),
                          height: 5.0,
                          width: double.infinity,
                        ),
                      ),
                      const Text(
                        'Normal ',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (result >= 25.0 && result <= 40)
                  Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              2.0,
                            ),
                            color: Colors.blue,
                          ),
                          height: 5.0,
                          width: double.infinity,
                        ),
                      ),
                      const Text(
                        'OverWeight ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
