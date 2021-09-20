import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("           Age Calculator")),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
          ]),

    );
  }
}
