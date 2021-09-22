import 'package:age_calculator/screens/add_subtract_day.dart';
import 'package:age_calculator/screens/age_calculator.dart';
import 'package:age_calculator/screens/age_difference.dart';
import 'package:age_calculator/screens/home_page.dart';
import 'package:age_calculator/screens/leap_year.dart';
import 'package:age_calculator/screens/working_days_dates.dart';
import 'package:flutter/material.dart';
void main(){

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //  primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.grey, // <-- your color
      ),


      home: const HomePage(),



    );
  }
}
