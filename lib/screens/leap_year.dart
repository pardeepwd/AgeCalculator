import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'package:share/share.dart';

class LeapYear extends StatefulWidget {
  const LeapYear({Key? key}) : super(key: key);

  @override
  _LeapYearState createState() => _LeapYearState();
}

class _LeapYearState extends State<LeapYear> {
  DateTime selectedToDate = DateTime.now();

  DateTime now = DateTime.now();

  _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 2.0,
            actions: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                      child: InkWell(
                    onTap: () {
                      Share.share(
                          'check out my website https://protocoderspoint.com/',
                          subject: 'Sharing on Email');
                    },
                    child: const Text(
                      "Share",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  )),
                  const Text("Rate it",
                    style: TextStyle(fontSize: 15, color: Colors.grey),),
                  const Text("FeedBack",
                    style: TextStyle(fontSize: 15, color: Colors.grey),),
                  const Text("More Apps",
                    style: TextStyle(fontSize: 15, color: Colors.grey),)
                ],
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate,
        firstDate: DateTime(1990,1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
      });
    }
  }

  Widget leapYear() {
    if (selectedToDate.year % 4 == 0 && selectedToDate.year % 100 != 0 ||
        selectedToDate.year % 400 == 0) {
      return const Text(
        "Yes",
        style: TextStyle(color: Colors.white),
      );
    } else {
      return const Text(
        "No",
        style: TextStyle(color: Colors.white),
      );
    }
  }

  bool isleapYear = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
            title: const Center(child: Text("Leap Year  ")),
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
                  onPressed: () {
                    var date = selectedToDate.year;
                    _onWillPop();
                    leapYear();
                    print(date);
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ]),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                  ),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(
                      "A year with 366 days instead of the normal 365 Days in known as"
                      " leap year extra day is added in February which has 29 days instead of "
                      "the normal 28 days Leap year occur every 4 year "
                      "2020 is a Leap year and so is 2024",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200, bottom: 10),
                  child: Text(
                    "Enter the Year",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                  ),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${selectedToDate.year}".split(' ')[0],
                            style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        const SizedBox(width: 190,),
                        IconButton(
                          onPressed: () => selectDate(context),
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      //
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
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
                                  "Total days in the year",
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
                                "${daysInMonth(selectedToDate.year, 1)}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
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
                                  "is a Leap Year?",
                                  style: TextStyle(
                                      color: AppColors.appPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                child: isleapYear ? leapYear() : const Text(""),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Result",
                          style: TextStyle(
                              color: AppColors.appPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 45,
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Months",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      "Days",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 38, bottom: 10),
                                    child: Text(
                                      "January",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "${daysInMonth(selectedToDate.year, 1)}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, bottom: 10),
                                    child: Text(
                                      "February",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "${daysInMonth(selectedToDate.year, 2)}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, bottom: 10),
                                    child: Text(
                                      "March",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "${daysInMonth(selectedToDate.year, 3)}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 65, bottom: 10),
                                    child: Text(
                                      "April",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "${daysInMonth(selectedToDate.year, 4)}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 68, bottom: 10),
                                    child: Text(
                                      "May",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 5)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, bottom: 10),
                                    child: Text(
                                      "June",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 6)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 72, bottom: 10),
                                    child: Text(
                                      "july",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 7)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 10),
                                    child: Text(
                                      "August",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 8)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, bottom: 10),
                                    child: Text(
                                      "September",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 9)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, bottom: 10),
                                    child: Text(
                                      "October",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 10)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Text(
                                      "November",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 11)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Text(
                                      "December",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimary),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${daysInMonth(selectedToDate.year, 12)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ));
  }
}
