import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiveAdmin {
  final String carId;
  final String phone;
  final String province;
  final Timestamp timeService;
  ReceiveAdmin({
    required this.carId,
    required this.phone,
    required this.province,
    required this.timeService,
  });

  Map<String, dynamic> toMap() {
    return {
      'carId': carId,
      'phone': phone,
      'province': province,
      'timeService': timeService,
    };
  }

  factory ReceiveAdmin.fromMap(Map<String, dynamic> map) {
    return ReceiveAdmin(
      carId: map['carId'] ?? '',
      phone: map['phone'] ?? '',
      province: map['province'] ?? '',
      timeService: map['timeService'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReceiveAdmin.fromJson(String source) => ReceiveAdmin.fromMap(json.decode(source));
}
