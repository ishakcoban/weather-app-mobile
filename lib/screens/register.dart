import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/globals/colors.dart';
import '../widgets/backgroundTemp.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();
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
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 8 / 10,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Weathy',
                          style:
                              TextStyle(fontFamily: 'Courgette', fontSize: 50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: TextField(
                          obscureText: false,
                          controller: nameController,
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
                              labelText: 'Name',
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
                        margin: EdgeInsets.only(top: 35),
                        child: TextField(
                          obscureText: false,
                          controller: surnameController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
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
                              labelText: 'Surname',
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
                        margin: EdgeInsets.only(top: 35),
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
                                    BorderSide(width: 2, color: Colors.black),
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
                        margin: EdgeInsets.only(top: 35),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
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
                              labelText: 'Password',
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
                          controller: passwordAgainController,
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
                              labelText: 'Password(Again)',
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
                        onTap: () async {
                          await createUser();
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
                            'REGISTER',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 1 / 2),
                                fontWeight: FontWeight.bold),
                          ),
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

  Future<void> createUser() async {
    if (nameController.text.length != 0 &&
        surnameController.text.length != 0 &&
        emailController.text.length != 0 &&
        passwordController.text.length != 0 &&
        passwordAgainController.text.length != 0 &&
        passwordController.text == passwordAgainController.text) {
      Navigator.pushNamed(context, '/login');
      final document = FirebaseFirestore.instance.collection('users').doc();

      var json = {
        'name': nameController.text,
        'surname': surnameController.text,
        'email': emailController.text,
        'password': passwordController.text
      };

      await document.set(json);
    } else {
      setState(() {
        errorMessage = true;
      });
    }
  }
}
