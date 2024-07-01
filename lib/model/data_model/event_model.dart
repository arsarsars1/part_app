import 'package:flutter_calendar_carousel/classes/event.dart';

class EventModel extends Event {
  final int? flag;

  EventModel({
    this.flag = 0,
    required super.date,
    super.title,
    super.description,
    super.location,
    super.icon,
    super.dot,
    super.id,
  });
}
