import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';
import '../globals/colors.dart';
import './home/dropdownMenu.dart';
import '../services/http.dart';
import 'dart:convert' as convert;

class AddClothes extends StatefulWidget {
  const AddClothes({super.key});

  @override
  State<AddClothes> createState() => _AddClothesState();
}

class _AddClothesState extends State<AddClothes> {
  bool activated = false;
  bool confirmActivated = true;
  Future<List<String>> fetchCategories() async {
    var resp;
    try {
      var response = await createHttpRequest('/categories', 'GET', {}, context);
      var result = convert.jsonDecode(response.body)['categories'];
      return convert.jsonDecode(result).cast<String>().toList();
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
  }

  Future<List<String>> fetchSubCategories() async {
    var resp;
    try {
      var response =
          await createHttpRequest('/subCategories', 'GET', {}, context);
      var result = convert.jsonDecode(response.body)['subCategories'];
      return convert.jsonDecode(result).cast<String>().toList();
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
  }

  Future<List<String>> fetchTypes() async {
    var resp;
    try {
      var response = await createHttpRequest('/types', 'GET', {}, context);
      var result = convert.jsonDecode(response.body)['types'];

      return convert.jsonDecode(result).cast<String>().toList();
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
  }

  Future<List<String>> fetchColors() async {
    var resp;
    try {
      var response = await createHttpRequest('/colors', 'GET', {}, context);
      var result = convert.jsonDecode(response.body)['colors'];
      return convert.jsonDecode(result).cast<String>().toList();
    } catch (err) {
      print("Uncaught error: $err");
    }

    return resp;
  }

  Future<List<String>> fetchClothes() async {
    var resp;
    try {
      var response = await createHttpRequest('/clothes', 'GET', {}, context);
      var result = convert.jsonDecode(response.body)['clothes'];

      return convert.jsonDecode(result).cast<String>().toList();
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
                colors: [purpleColorDark, blueColorLight, blueColorDark])),
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
                child: activated
                    ? Container(
                        margin: EdgeInsets.only(top: 110),
                        child: confirmActivated
                            ? Column(
                                children: [
                                  FutureBuilder<List<String>>(
                                      future: fetchCategories(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownMenu(
                                              'Select a category',
                                              snapshot.data!);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  FutureBuilder<List<String>>(
                                      future: fetchSubCategories(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownMenu(
                                              'Select a sub category',
                                              snapshot.data!);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  FutureBuilder<List<String>>(
                                      future: fetchTypes(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownMenu(
                                              'Select a type', snapshot.data!);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  FutureBuilder<List<String>>(
                                      future: fetchColors(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownMenu(
                                              'Select a color', snapshot.data!);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  FutureBuilder<List<String>>(
                                      future: fetchClothes(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownMenu(
                                              'Select a cloth', snapshot.data!);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          confirmActivated = false;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 60),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                6 /
                                                10,
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            border: Border.all(
                                                color: purpleColorDark,
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                              color: purpleColorDark,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ))
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 120),
                                alignment: Alignment.center,
                                child: Text(
                                  'Saved Successfully!' +
                                      '\n' +
                                      'Thanks for your attention!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                              ))
                    : Stack(alignment: Alignment.topCenter, children: [
                        Container(
                          child: Image.asset(
                              'assets/images/bgLoginRegister2White.png'),
                        ),
                        Positioned.fill(
                            child: Container(
                          margin: EdgeInsets.only(top: 100, left: 35),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'For today,' +
                                      '\n' +
                                      'which clothes' +
                                      '\n' +
                                      'did you wear?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activated = true;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 100),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: blackColor, width: 3 / 2)),
                                    child: Text(
                                      'ADD',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                )
                              ]),
                        ))
                      ])),
          ),
        ));
  }
}
