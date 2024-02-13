import 'package:flutter/material.dart';

class Meeting {

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;

  Meeting({this.eventName, int? year, int? month, int? day, int? hours, int? minutes, this.to, this.background, this.isAllDay}){
      this.from = DateTime.utc(year!, month!, day!, hours!, minutes!);
  }

}