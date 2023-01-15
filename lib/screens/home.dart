import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';
import '../globals/colors.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import '../widgets/weatherStatus.dart';
import '../services/http.dart';
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var weatherStatus;
  Future<Map<String, dynamic>> getInfo() async {
    var id = await Provider.of<Auth>(context, listen: false).getId();
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(id).get();

    return docSnapshot.data()!; // return your response
  }

  Future<Map<String, dynamic>> fetchPosts() async {
    var resp;
    try {
      var response = await createHttpRequest('/linear', 'GET', {}, context);
      return convert.jsonDecode(response.body);
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [greyishColor, blueColorLight])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: bottomNavigationBar(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppbar(),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: FutureBuilder<Map<String, dynamic>>(
                    future: fetchPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> myMap = Map.from(snapshot.data!);

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            blueColorLight,
                                            blueColorDark
                                          ])),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 35),
                                  margin: EdgeInsets.only(top: 20, bottom: 30),
                                  child: Text(
                                    'For Today, weather prediction',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 75),
                                  width: MediaQuery.of(context).size.width *
                                      80 /
                                      100,
                                  height: MediaQuery.of(context).size.height *
                                      55 /
                                      100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      colors: [blueColorLight, blueColorDark],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            6 /
                                                            100),
                                                child: WeatherStatus(
                                                    'temperature.png',
                                                    'Temperature',
                                                    myMap['temperature']!,
                                                    4 / 10))
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              40 /
                                              100,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              40 /
                                              100,
                                          margin: EdgeInsets.only(left: 35),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 160,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(2 / 4),
                                                        spreadRadius: 0,
                                                        blurRadius: 6,
                                                        offset: Offset(0,
                                                            9), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                2800))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              40 /
                                              100,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              40 /
                                              100,
                                          margin: EdgeInsets.only(left: 35),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 145,
                                                height: 145,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/images/homeCloudy.png',
                                                  width: 100,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: blueColorDark,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                2800))),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(30 / 100),
                                                  spreadRadius: 0,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomRight:
                                                      Radius.circular(25)),
                                              color: blueColorDark),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 35),
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 15),
                                          child: Text(
                                            'Partly Cloudy',
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    WeatherStatus('pressure.png', 'Pressure',
                                        myMap['pressure'], 7 / 10),
                                    WeatherStatus('wind.png', 'Wind',
                                        myMap['wind']!, 6 / 10),
                                    WeatherStatus('humidity.png', 'Humidity',
                                        myMap['humidity']!, 5 / 10)
                                  ],
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            )));
  }
}
