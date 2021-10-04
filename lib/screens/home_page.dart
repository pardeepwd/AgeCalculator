import 'package:age_calculator/screens/working_days_dates.dart';
import 'package:age_calculator/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';

import 'add_subtract_day.dart';
import 'add_view_members.dart';
import 'age_calculator.dart';
import 'age_difference.dart';
import 'leap_year.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;


  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   InterstitialAd.load(
  //       adUnitId: 'ca-app-pub-3940256099942544/1033173712',
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
  //         setState(() {
  //           _isInterstitialAdReady = true;
  //           this._interstitialAd = ad;
  //         });
  //         print("Ad is loaded");
  //       }, onAdFailedToLoad: (err) {
  //         print("Failed to load the of google");
  //       }));
  // }

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
                      "Share",
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
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: InkWell(
                              onTap: () {


                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const AgeCalculator()));
                                if (_isInterstitialAdReady) {
                                  _interstitialAd!.show();

                                } else {}
                              },
                              child: Text(
                                "Age Calculator",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 125,
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
                            onTap: () {
                              if (_isInterstitialAdReady) {
                                _interstitialAd!.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddViewMembers()));
                              } else {}
                            },
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
                height: 310,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
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
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (_isInterstitialAdReady) {
                                _interstitialAd!.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddSubtract()));
                              } else {}
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13),
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
                            padding: EdgeInsets.only(top: 13, left: 23),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const WorkingDays()));




                                if (_isInterstitialAdReady) {
                                  _interstitialAd!.show();

                                } else {}
                              },
                              child: Text(
                                "Working Days Between Dates",
                                style: TextStyle(
                                    color: AppColors.appPrimary,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12, left: 23),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
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
                            onTap: () {
                              if (_isInterstitialAdReady) {
                                _interstitialAd!.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AgeDifference()));
                              } else {}
                            },
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
                            onTap: () {
                              if (_isInterstitialAdReady) {
                                _interstitialAd!.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LeapYear()));
                              } else {}
                            },
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
              // Container(
              //   child: isBannerLoaded? Container(
              //     child: AdWidget(ad: bannerAd! ),
              //   ):const SizedBox(),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.white),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   height: 200,
              //   width: double.infinity,
              // ),
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

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
