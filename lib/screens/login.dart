import 'package:flutter/material.dart';
import 'package:weather_app/globals/colors.dart';
import '../widgets/backgroundTemp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FocusNode myFocusNode = FocusNode();

  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundTemp(),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 8 / 10,
                  height: MediaQuery.of(context).size.height * 6 / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Weathy',
                          style:
                              TextStyle(fontFamily: 'Courgette', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: blackColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                    width: 2, color: blackColor), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontWeight: myFocusNode.hasFocus
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  color: myFocusNode.hasFocus
                                      ? blackColor
                                      : Color.fromARGB(111, 0, 0, 0))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35, bottom: 45),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: blackColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(
                                    width: 2, color: blackColor), //<-- SEE HERE
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              labelStyle: TextStyle(
                                  fontWeight: myFocusNode.hasFocus
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  color: myFocusNode.hasFocus
                                      ? blackColor
                                      : Color.fromARGB(111, 0, 0, 0))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 6 / 10,
                          height: MediaQuery.of(context).size.height * 1 / 15,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [yellowColorLight, yellowColorDark]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 1 / 2),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'Sign up!',
                          style: TextStyle(
                              color: whiteColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
