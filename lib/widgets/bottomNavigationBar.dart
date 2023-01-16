import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../screens/home.dart';

class bottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, '/weather');
              break;
            case 2:
              Navigator.pushNamed(context, '/addClothes');
              break;
            case 3:
              Navigator.pushNamed(context, '/clothes');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
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
            icon: Image.asset(
              ModalRoute.of(context)?.settings.name == '/home'
                  ? 'assets/images/bottomNavigationBar/homeActive.png'
                  : 'assets/images/bottomNavigationBar/home.png',
              width: 30,
            ) /*Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor)*/
            ,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ModalRoute.of(context)?.settings.name == '/weather'
                  ? 'assets/images/bottomNavigationBar/weatherActive.png'
                  : 'assets/images/bottomNavigationBar/weather.png',
              width: 35,
            ) /*Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor)*/
            ,
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bottomNavigationBar/plus.png',
              width: 35,
            ) /*Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor)*/
            ,
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ModalRoute.of(context)?.settings.name == '/clothes'
                  ? 'assets/images/bottomNavigationBar/clothesActive.png'
                  : 'assets/images/bottomNavigationBar/clothes.png',
              width: 35,
            ) /*Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor)*/
            ,
            label: 'Clothes',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ModalRoute.of(context)?.settings.name == '/profile'
                  ? 'assets/images/bottomNavigationBar/userActive.png'
                  : 'assets/images/bottomNavigationBar/user.png',
              width: 30,
            ) /*Icon(Icons.home,
                size: 30,
                color: ModalRoute.of(context)?.settings.name == '/home'
                    ? blackColor
                    : greyColor)*/
            ,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
