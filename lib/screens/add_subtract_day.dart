import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';

class AddSubtract extends StatefulWidget {
  const AddSubtract({Key? key}) : super(key: key);

  @override
  _AddSubtractState createState() => _AddSubtractState();
}

class _AddSubtractState extends State<AddSubtract> {
  TextEditingController yearOf = TextEditingController();
  TextEditingController monthOf = TextEditingController();
  TextEditingController dayOf = TextEditingController();

  DateTime selectedToDate = DateTime.now();
  DateTime now = DateTime.now();
  var weekDay;
  var formate;
  int? newYear;
  int? newMonth;
  int? newDay;

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
      });
    }
  }

  clickMethod() {
    var date = DateTime(
        selectedToDate.year + int.parse(yearOf.text),
        selectedToDate.month + int.parse(monthOf.text),
        selectedToDate.day + int.parse(dayOf.text));
    formate = "${date.year}-${date.month}-${date.day}";

    weekDay = date.weekday;
  }

  // Widget resultCalculate() {
  //   return Text(
  //     "${selectedToDate.year + int.parse(yearOf.text)}"
  //     "-"
  //     "${selectedToDate.month + int.parse(monthOf.text)}"
  //     "-"
  //     "${selectedToDate.day + int.parse(dayOf.text)}",
  //     style: const TextStyle(
  //         color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("Add/Sub Day from Date")),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                )),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, bottom: 5, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Enter Date",
                    style: TextStyle(
                        color: AppColors.appPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${selectedToDate.toLocal()}".split(' ')[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 122,
                      ),
                      IconButton(
                        onPressed: () => selectToDate(context),
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Years",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  SizedBox(
                    height: 45,
                    width: 200,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: yearOf,
                      decoration: InputDecoration(
                        labelText: "Enter Year",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Months",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    height: 45,
                    width: 200,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: monthOf,
                      decoration: InputDecoration(
                        labelText: "Enter Months",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Days",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 74,
                  ),
                  SizedBox(
                    height: 45,
                    width: 200,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: dayOf,
                      decoration: InputDecoration(
                        labelText: "Enter Days",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          isResultCalculate = true;
                          clickMethod();

                          setState(() {});
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     isResultCalculate = false;
                    //     setState(() {});
                    //   },
                    //   child: const Text(
                    //     "Clear",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, bottom: 5, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Results",
                    style: TextStyle(
                        color: AppColors.appPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30, top: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "New Date -",
                              style: TextStyle(
                                  color: AppColors.appPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text("$formate",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          // isResultCalculate
                          //     ? resultCalculate()
                          //     : const SizedBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "Week Day -",
                              style: TextStyle(
                                  color: AppColors.appPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            "$weekDay",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isResultCalculate = false;
}
