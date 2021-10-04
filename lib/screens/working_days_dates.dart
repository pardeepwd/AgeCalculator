import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';

class WorkingDays extends StatefulWidget {
  const WorkingDays({Key? key}) : super(key: key);

  @override
  _WorkingDaysState createState() => _WorkingDaysState();
}

class _WorkingDaysState extends State<WorkingDays> {
  DateTime startDateOf = DateTime.now();
  DateTime endDateOf = DateTime.now();
  DateTime now = DateTime.now();
  bool checkedValue = false;
  int counter=0;

  int totalDays = 0;
  int workingDaysM = 0;
  int workingDaysT = 0;
  int workingDaysW = 0;
  int workingDaysTh = 0;
  int workingDaysF = 0;
  int workingDaysS = 0;
  int workingDaysSu = 0;
  int totalWorkingDay = 0;
  int nonWorkingDays = 0;

  bool checkedValueMon = false;
  bool checkedValueTue = false;
  bool checkedValueWed = false;
  bool checkedValueThu = false;
  bool checkedValueFri = false;
  bool checkedValueSat = false;
  bool checkedValueSun = false;

  Future<void> startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDateOf,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != startDateOf) {
      setState(() {
        startDateOf = picked;
      });
    }
  }

  Future<void> endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDateOf,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDateOf) {
      setState(() {
        endDateOf = picked;
      });
    }
  }

  test() {


    for (int i = 0; i <= endDateOf.difference(startDateOf).inDays; i++) {

      if(checkedValueMon == true){

        counter++;

      }else if( checkedValueTue == true){

        counter++;
      }else if(checkedValueWed == true){

        counter++;
      }else if( checkedValueThu == true){
        counter++;

      }else if( checkedValueFri == true){

        counter++;
      }else if(checkedValueSat == true){

        counter++;
      }else if(checkedValueSun == true){

        counter++;

      }





    }

    print(counter);



    // setState(() {
    //
    //   totalWorkingDay = workingDaysM +
    //       workingDaysT +
    //       workingDaysW +
    //       workingDaysTh +
    //       workingDaysF +
    //       workingDaysS +
    //       workingDaysSu;
    //   totalDays = startDateOf.difference(endDateOf).inDays;
    //
    //
    // });
    //
    //
    //
    //
    // if (checkedValueMon == true) {
    //   workingDaysM = totalDays~/ 7;
    //
    // }  if (checkedValueTue == true) {
    //   workingDaysT = totalDays ~/ 7;
    //
    // }  if (checkedValueWed = true) {
    //   workingDaysW = totalDays ~/ 7;
    // }  if (checkedValueThu == true) {
    //   workingDaysTh = totalDays ~/ 7;
    // }  if (checkedValueFri == true) {
    //   workingDaysF = totalDays~/ 7;
    // }  if (checkedValueSat == true) {
    //   workingDaysS = totalDays ~/ 7;
    // }  if (checkedValueSun == true) {
    //   workingDaysSu = totalDays ~/ 7;
    // }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("Working Days b/w Dates")),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 230, bottom: 5, top: 5),
              child: Text(
                "Start Date",
                style: TextStyle(
                    color: AppColors.appPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
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
                        "${startDateOf.toLocal()}".split(' ')[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      IconButton(
                        onPressed: () => startDate(context),
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
              padding: const EdgeInsets.only(
                  left: 10, right: 240, bottom: 5, top: 10),
              child: Text(
                "End Date",
                style: TextStyle(
                    color: AppColors.appPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
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
                        "${endDateOf.toLocal()}".split(' ')[0],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      IconButton(
                        onPressed: () => endDate(context),
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
            CheckboxListTile(
              activeColor: AppColors.appPrimary,
              title: const Text(
                "Include End Date",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select Working Days",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.appPrimary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: checkedValueMon,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueMon = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Mon",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Checkbox(
                              value: checkedValueTue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueTue = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Tue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Checkbox(
                              value: checkedValueWed,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueWed = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Wed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Checkbox(
                              value: checkedValueThu,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueThu = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Thu",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: checkedValueFri,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueFri = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Fri",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Checkbox(
                              value: checkedValueSat,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueSat = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Sat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Checkbox(
                              value: checkedValueSun,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueSun = newValue!;
                                });
                              },
                            ),
                            const Text(
                              "Sun",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
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
                      "Public Holidays",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: 170,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Holidays",
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
              padding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 0),
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
                          test();
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    ElevatedButton(
                      onPressed: () {





                      },
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Working Days",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 400,
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
                                const EdgeInsets.only(left: 59, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Total Days",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appPrimary),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "${startDateOf.difference(endDateOf).inDays}"
                                      .replaceAll('-', ' '),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 34, bottom: 10),
                                child: Text(
                                  "Working Days",
                                  style: TextStyle(
                                      fontSize: 17,
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
                                  "$totalWorkingDay".replaceAll('-', ' '),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Non Working days",
                                  style: TextStyle(
                                      fontSize: 17,
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
                                  "${totalWorkingDay-totalDays}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15, bottom: 10),
                                child: Text(
                                  "--------------------------",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 70,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Monday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 67, bottom: 10),
                                child: Text(
                                  "Tuesday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 43, bottom: 10),
                                child: Text(
                                  "Wednesday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 59, bottom: 10),
                                child: Text(
                                  "Thursday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 84, bottom: 10),
                                child: Text(
                                  "Friday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 62, bottom: 10),
                                child: Text(
                                  "Saturday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 74, bottom: 10),
                                child: Text(
                                  "Sunday",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {

  }
}
