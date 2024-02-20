import 'package:flutter/material.dart';

class Meeting {

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay = false;

  Meeting.fromData({this.eventName, int? year, int? month, int? day, int? hours, int? minutes,  this.background, this.isAllDay}){
      this.from = DateTime.utc(year!, month!, day!, hours!, minutes!);
      this.to = from!.add(const Duration(hours: 2));
  }

}