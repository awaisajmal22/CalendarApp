import 'package:flutter/material.dart';

class EventModel {
  int? id;
  String? eventName;
  String? eventDescription;
  int? date;
  int? startTime;
  int? endTime;
  int? repeat;
  String? category;
  dynamic? color;
  EventModel(
      {this.id,
      this.color,
      this.eventName,
      this.eventDescription,
      this.date,
      this.category,
      this.endTime,
      this.repeat,
      this.startTime});
  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    eventName = json['eventName'];
    eventDescription = json['description'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    repeat = json['repeat'];
    category = json['category'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['eventName'] = eventName;
    data['description'] = eventDescription;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['repeat'] = repeat;
    data['color'] = color;
    data['category'] = category;
    return data;
  }
}
