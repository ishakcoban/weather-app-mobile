import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';
import '../globals/colors.dart';
import '../widgets/profileInfo.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Map<String, dynamic>> getInfo() async {
    var id = await Provider.of<Auth>(context, listen: false).getId();
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(id).get();

    return docSnapshot.data()!; // return your response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  future: getInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, String> myMap = Map.from(snapshot.data!);
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 65),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/profileTemp.png',
                              width: MediaQuery.of(context).size.width * 8 / 10,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2, bottom: 30),
                            alignment: Alignment.center,
                            child: Text(
                              "${myMap['name']} ${myMap['surname']}",
                              style: TextStyle(
                                  color: blackColor,
                                  fontFamily: 'Courgette',
                                  fontSize: 25),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                colors: [blueColorLightOpacity, blueColorDark],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 9 / 10,
                            child: Column(children: [
                              ProfileInfo('Name', myMap['name']!),
                              SizedBox(
                                height: 25,
                              ),
                              ProfileInfo('Surname', myMap['surname']!),
                              SizedBox(
                                height: 25,
                              ),
                              ProfileInfo('Email', myMap['email']!),
                              SizedBox(
                                height: 25,
                              ),
                              ProfileInfo('Password', '*********'),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              width: MediaQuery.of(context).size.width * 5 / 10,
                              height:
                                  MediaQuery.of(context).size.height * 1 / 15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        yellowColorLight,
                                        yellowColorDark
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35))),
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    color: Color.fromRGBO(0, 0, 0, 1 / 2),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  })),
        ));
  }
}
