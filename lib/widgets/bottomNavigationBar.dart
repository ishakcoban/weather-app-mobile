import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../screens/home.dart';

class bottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void changeRoute() {
      Navigator.pushNamed(context, '/home');
    }

    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/postAd');
              break;
            case 2:
              Navigator.pushNamed(context, '/ads');
              break;
            default:
          }
        },

        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        //unselectedItemColor: Colors.white,
        //selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              size: 35,
              color: ModalRoute.of(context)?.settings.name == '/postAd'
                  ? blackColor
                  : greyColor,
            ),
            label: 'Post Ad',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ModalRoute.of(context)?.settings.name == '/ads'
                  ? 'assets/images/adsBlack.png'
                  : 'assets/images/adsWhite.png',
              width: 30,
            ),
            label: 'Ads',
          ),
        ],
      ),
    );
  }
}
