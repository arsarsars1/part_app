import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

class EventModel extends Event{
  final int? flag;
  

  EventModel({
  this.flag = 0,
  required DateTime date,
  String? title,
  String? description,
  String? location,
  Widget? icon,
  Widget? dot,
  int? id,
  
  }) : super(id: id, date: date, title: title, 
  description: description, location: location, icon: icon,
  dot: dot,);

  
}

