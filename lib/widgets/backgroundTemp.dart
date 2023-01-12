import 'package:flutter/material.dart';

class BackgroundTemp extends StatelessWidget {
  const BackgroundTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/bgLoginRegister.png'),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/bgLoginRegister2.png'),
            )
          ],
        ));
  }
}
