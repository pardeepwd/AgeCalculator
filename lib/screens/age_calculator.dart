import 'package:age_calculator/google_ads/ad_helper.dart';
import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {

  BannerAd? bannerAd;
  bool isBannerLoaded = false;




  DateTime selectedToDate = DateTime.now();
  DateTime dateOfBirth = DateTime.now();
  DateTime now = DateTime.now();
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());


  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
        String Onlydate = new DateFormat("yyyy-MM-dd").format(picked);

        date = '$Onlydate';


      });
    }
  }

  Future<void> dateBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateOfBirth,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        dateOfBirth = picked;
      });
    }
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
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
                      "",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  )),
              const InkWell(
                  child: Text(
                    "Rate it",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )),
              const InkWell(
                child: Text(
                  "FeedBack",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              const InkWell(
                child: Text(
                  "More Apps",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              )
            ],
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("      Age Calculator")),
          actions: [
            IconButton(
                onPressed: () {
                  Share.share(
                      'check out my website https://protocoderspoint.com/',
                      subject: 'Sharing on Email');
                },
                icon: const Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  _onWillPop();
                },
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                )),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Today's Date",
                    style: TextStyle(
                        color: AppColors.appPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                   const Text(
                    "",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                        width: 110,
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Date of Birth",
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
                        "${dateOfBirth.toLocal()}".split(' ')[0],
                        style:
                        const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 122,
                      ),
                      IconButton(
                        onPressed: () => dateBirth(context),
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
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Container(
            //     height: 45,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       //border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            // ElevatedButton(
            //     onPressed: () {
            //
            //     },
            //     child: const Text(
            //       "Calculate",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold),
            //     )),
            // const SizedBox(
            //
            //   width: 25,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text(
            //     "Clear",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            //       ],
            //     ),
            //   ),
            // ),

            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 5,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Age",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 80,
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
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Years",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${selectedToDate.year - dateOfBirth.year}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Months",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${dateOfBirth.month - selectedToDate.month}"
                                    .replaceAll('-', ''),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Days",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${dateOfBirth.day - selectedToDate.day}"
                                    .replaceAll('-', ''),
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
            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Next Birthday",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 80,
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
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Months",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${dateOfBirth.month - selectedToDate.month }"
                                    .replaceAll('-', ''),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 115,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Days",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${selectedToDate.day - dateOfBirth.day}"
                                    .replaceAll('-', ''),
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
            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Extra",
                      style: TextStyle(
                          color: AppColors.appPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 210,
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
                            const EdgeInsets.only(left: 26, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Total years",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appPrimary),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "${selectedToDate.year - dateOfBirth.year}",
                                  style: const TextStyle(
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
                                padding:
                                const EdgeInsets.only(left: 7, bottom: 10),
                                child: Text(
                                  "Total months",
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
                                  "${((selectedToDate.year - dateOfBirth.year) *
                                      12) + selectedToDate.month -
                                      dateOfBirth.month }"
                                      "",
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
                                padding:
                                const EdgeInsets.only(left: 34, bottom: 10),
                                child: Text(
                                  "Total days",
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
                                  "${selectedToDate
                                      .difference(dateOfBirth)
                                      .inDays}",
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
                                padding:
                                const EdgeInsets.only(left: 34, bottom: 10),
                                child: Text(
                                  "Total hours",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appPrimary),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "${selectedToDate
                                      .difference(dateOfBirth)
                                      .inHours}",
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
                                padding:
                                const EdgeInsets.only(left: 2, bottom: 10),
                                child: Text(
                                  "Total minutes",
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
                                  "${selectedToDate
                                      .difference(dateOfBirth)
                                      .inMinutes}",
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
                              Text(
                                "Total seconds",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appPrimary),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "${selectedToDate
                                    .difference(dateOfBirth)
                                    .inSeconds}",
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
            Container(
              child: isBannerLoaded? Container(
                child: AdWidget(ad: bannerAd! ),
              ):const SizedBox(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );

  }

  @override
  void dispose() {
    dateOfBirth;
    selectedToDate;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (ad){

            setState(() {
              isBannerLoaded = true;
            });
            print("AD IS LOADED");

          },
          onAdFailedToLoad: (ad, err){
            ad.dispose();
            print("AD IS NOT LOADED");
          }

      ),
      request: AdRequest(),
    );
    bannerAd!.load();
  }
}
