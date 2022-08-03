import 'package:flutter/material.dart';
import 'package:time_table_app/screens/wrapper.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = "Time Table";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Wrapper(),
    );
  }
}

