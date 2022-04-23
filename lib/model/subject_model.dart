import 'package:flutter/material.dart';

class Subject{
  String name;
  DateTime startTime;
  Duration duration;
  Color color;
  String description;

  Subject({required this.name, required this.color, this.description="",
    required this.startTime, required this.duration});
}