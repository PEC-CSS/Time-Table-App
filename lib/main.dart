import 'package:flutter/material.dart';

import 'home/home_page.dart';


void main() {
  runApp(App());
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = "Time Table";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Home(title: _title,),
    );
  }
}

