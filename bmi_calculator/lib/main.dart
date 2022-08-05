import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF0A0E21),
          secondary: Colors.purple,
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        appBarTheme: AppBarTheme(
            // backgroundColor: Color(0xff0a0e21),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) {
          final arg =
              ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          return ResultScreen(arg);
        },
      },
      // home: Navigator(),
    );
  }
}
