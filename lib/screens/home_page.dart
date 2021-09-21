import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';

import 'add_subtract_day.dart';
import 'age_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 2.0,
            actions: <Widget>[
              Column(
                children:const <Widget> [
                  Center(child: Text("Share",style: TextStyle(fontSize: 15,color: Colors.grey),)),
                  Text("Rate it"),
                  Text("FeedBack"),
                  Text("More Apps")

                ],
              ),

            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
            title: const Center(child: Text("           Age Calculator")),
            actions: [
              IconButton(
                  onPressed: () {
                    _onWillPop();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AgeCalculator()));
                                },
                                child: InkWell(

                                  child: Text(
                                    "Age Calculator",
                                    style: TextStyle(
                                        color: AppColors.appPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 85,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: Text(
                                "Add Family & Friends",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 290,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only( top: 8,left: 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),

                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddSubtract()));
                              },
                              child: InkWell(
                                child: Text(
                                  "Add/Subtract Days from Date",
                                  style: TextStyle(
                                      color: AppColors.appPrimary,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 10,),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              child: Text(
                                "Working Days Between Dates",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: Text(
                                "Age Difference",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 125,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: Text(
                                "Leap year",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 172,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Other Apps",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }
}
