import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AgeDifference extends StatefulWidget {
  const AgeDifference({Key? key}) : super(key: key);

  @override
  _AgeDifferenceState createState() => _AgeDifferenceState();
}

class _AgeDifferenceState extends State<AgeDifference> {
  TextEditingController firstPerson = TextEditingController();
  TextEditingController secondPerson = TextEditingController();

  DateTime firstPersonDate = DateTime.now();
  DateTime secondPersonDate = DateTime.now();
  DateTime now = DateTime.now();

  Future<void> dateBirthFirst(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: firstPersonDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != firstPersonDate) {
      setState(() {
        firstPersonDate = picked;
      });
    }
  }

  Future<void> dateBirthSecond(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: secondPersonDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != secondPersonDate) {
      setState(() {
        secondPersonDate = picked;
      });
    }
  }

  Widget calculateResult() {
    String firstName = firstPerson.text;
    String secondName = secondPerson.text;

    if (firstPersonDate.year <= secondPersonDate.year) {
      return Column(
        children: <Widget>[
          Text(
            "$firstName" " " "is",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "${firstPersonDate.year - secondPersonDate.year} " "Years"
                .replaceAll('-', '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "${firstPersonDate.month - secondPersonDate.month} " "Months"
                .replaceAll(('-'), '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            " ${firstPersonDate.day - secondPersonDate.day}" "Days"
                .replaceAll(('-'), '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            " Older than " "$secondName",
            style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            "$secondName" " " "is",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "${firstPersonDate.year - secondPersonDate.year} " "Years"
                .replaceAll('-', '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "${firstPersonDate.month - secondPersonDate.month} " "Months"
                .replaceAll(('-'), '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            " ${firstPersonDate.day - secondPersonDate.day}" "Days"
                .replaceAll(('-'), '  '),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            " Older than " "$firstName",
            style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("Age Difference")),
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 8, right: 230),
                child: Text(
                  "First Person",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPrimary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 8),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: firstPerson,
                    decoration: InputDecoration(
                      labelText: "Enter Name",
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
                          "${firstPersonDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(
                          width: 103,
                        ),
                        IconButton(
                          onPressed: () => dateBirthFirst(context),
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
                    left: 15, bottom: 8, right: 205, top: 8),
                child: Text(
                  "Second Person",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPrimary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 8),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: secondPerson,
                    decoration: InputDecoration(

                      labelText: "Enter Name",
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
                          "${secondPersonDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(
                          width: 103,
                        ),
                        IconButton(
                          onPressed: () => dateBirthSecond(context),
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
                            isCalculate = true;
                            setState(() {});
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
                          isCalculate = false;
                          setState(() {});
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
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 250,
                  width: double.infinity,
                  child: isCalculate
                      ? Center(
                          child: calculateResult(),
                        )
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isCalculate = false;
}
