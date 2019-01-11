import 'package:flutter/material.dart';
import 'package:joke_app_orientation/ui/master_detail_screen.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MasterDetailScreen()
    );
  }
}

