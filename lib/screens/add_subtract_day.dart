import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';

class AddSubtract extends StatefulWidget {
  const AddSubtract({Key? key}) : super(key: key);

  @override
  _AddSubtractState createState() => _AddSubtractState();
}

class _AddSubtractState extends State<AddSubtract> {

  DateTime selectedToDate = DateTime.now();
  DateTime now = DateTime.now();

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate,
        firstDate: DateTime(now.year, now.month),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("  Age Calculator")),
          leading: IconButton(
            onPressed: (){},
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
      body: Column(
        children:<Widget> [
          Padding(
            padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
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
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 0),
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
          Row(
            children:<Widget> [
              Text("Years"),
              SizedBox(width: 0,),
              TextFormField(

                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                )
              )
            ],
          ),


        ],
      ),

    );
  }
}
