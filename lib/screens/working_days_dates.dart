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

  Future<void> startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDateOf,
        firstDate: DateTime(now.year, now.month),
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

  // List<ListModel>? dataList;
  // List<String> userChecked = [];
  // bool isChecked = false;

  @override
  void initState() {
    super.initState();

    // ListModel listModel = ListModel("Mon", false);
    // ListModel listModel2 = ListModel("Tue", false);
    // ListModel listModel3 = ListModel("Wed", false);
    // ListModel listModel4 = ListModel("Thu", false);
    // ListModel listModel5 = ListModel("Fri", false);
    // ListModel listModel6 = ListModel("Sat", false);
    // ListModel listModel7 = ListModel("Sun", false);
    // dataList = [];
    // dataList!.add(listModel);
    // dataList!.add(listModel2);
    // dataList!.add(listModel3);
    // dataList!.add(listModel4);
    // dataList!.add(listModel5);
    // dataList!.add(listModel6);
    // dataList!.add(listModel7);
  }

  // void _onSelected(bool selected, String title) {
  //   if (selected == true) {
  //     setState(() {
  //       userChecked.add(title);
  //     });
  //   } else {
  //     setState(() {
  //       userChecked.remove(title);
  //     });
  //   }
  // }

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
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      // Row(
                      //   children:<Widget> [
                      //     Flexible(
                      //       child: View.builder(
                      //           itemCount: dataList?.length,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return  Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Checkbox(
                      //                       value: dataList?[index].value,
                      //                       onChanged: (bool? value) {
                      //                         setState(() {
                      //                           dataList?[index].value = value!;
                      //                           _onSelected(value!,
                      //                               dataList![index].title.toString());
                      //                         });
                      //                       })
                      //                 ],
                      //               );
                      //
                      //           }),
                      //     )
                      //   ],
                      // ),
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
                        onPressed: () {},
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    ElevatedButton(
                      onPressed: () {},
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
                                const Text(
                                  "0",
                                  style: TextStyle(
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
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
                                padding: EdgeInsets.only(left: 70,bottom: 10,),
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
                                padding: EdgeInsets.only(left: 67,bottom: 10),
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
                                padding: EdgeInsets.only(left: 43,bottom: 10),
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
                                padding: EdgeInsets.only(left: 59,bottom: 10),
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
                                padding: EdgeInsets.only(left: 84,bottom: 10),
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
                                padding: EdgeInsets.only(left: 62,bottom: 10),
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
                                padding: EdgeInsets.only(left: 74,bottom: 10),
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
}
