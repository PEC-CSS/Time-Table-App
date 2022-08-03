import 'package:flutter/material.dart';
import 'package:time_table_app/screens/home/home_page.dart';
import 'package:time_table_app/screens/authenticate/authenticate_page.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isAuthenticated = true;

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? Home() : const Authenticate();
  }
}
