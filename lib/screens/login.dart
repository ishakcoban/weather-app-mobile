import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/globals/colors.dart';
import '../widgets/backgroundTemp.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:localstore/localstore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode myFocusNode = FocusNode();
  bool errorMessage = false;
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
                          controller: emailController,
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
                        margin: EdgeInsets.only(
                            top: 35, bottom: errorMessage ? 0 : 45),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
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
                      if (errorMessage)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 35),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 6 / 10,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                colors: [warningColorLight, warningColorDark],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Text(
                            'Invalid email or password!',
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      GestureDetector(
                        onTap: () {
                          loginHandler();
                        },
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
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Sign up!',
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  /*await Provider.of<Auth>(context, listen: false)
        .setId(document.id);
    var id = await Provider.of<Auth>(context, listen: false).getId();*/
  Future<void> loginHandler() async {
    var user = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailController.text)
        .get();

    if (user.size != 0 &&
        user.docs[0].data()['password'] == passwordController.text) {
      String userId = user.docs[0].id;
      await Provider.of<Auth>(context, listen: false).setId(userId);
      print(user.docs[0].id);
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        errorMessage = true;
      });
    }
  }
}
