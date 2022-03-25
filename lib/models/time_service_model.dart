import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TimeServiceModel {
  final List<String> carService;
  final List<String> motoService;
  final Timestamp workdate;
  TimeServiceModel({
    required this.carService,
    required this.motoService,
    required this.workdate,
  });

  Map<String, dynamic> toMap() {
    return {
      'carService': carService,
      'motoService': motoService,
      'workdate': workdate,
    };
  }

  factory TimeServiceModel.fromMap(Map<String, dynamic> map) {
    return TimeServiceModel(
      carService: List<String>.from(map['carService']),
      motoService: List<String>.from(map['motoService']),
      workdate: (map['workdate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeServiceModel.fromJson(String source) => TimeServiceModel.fromMap(json.decode(source));
}
