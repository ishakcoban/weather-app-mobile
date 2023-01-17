import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';
import '../globals/colors.dart';
import '../widgets/dailyWeather/dailyWeather.dart';
import '../services/http.dart';
import 'dart:convert' as convert;

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  Future<List<dynamic>> fetchData() async {
    var resp;
    try {
      var response = await createHttpRequest('/weakly', 'GET', {}, context);
      var result = convert.jsonDecode(response.body);
      return result['oneWeek'];
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
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
                  child: FutureBuilder<List<dynamic>>(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        var count = 0;
                        if (snapshot.hasData) {
                          return Column(children: [
                            for (var i in snapshot.data!)
                              new DailyWeather(
                                  convert.jsonDecode(i), count++, 'clothes')
                          ]);
                        } else {
                          return Container();
                        }
                      })),
            )));
  }
}
