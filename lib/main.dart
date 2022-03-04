import 'package:flutter/material.dart';

import 'home_screen.dart';

void main(){
  runApp(MCUAPI());
}

class MCUAPI extends StatelessWidget{
  const MCUAPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }

}