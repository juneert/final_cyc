import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiveModel {
  final String carId;
  final String phone;
  final String province;
  final String status;
  final Timestamp timeService;
  ReceiveModel({
    required this.carId,
    required this.phone,
    required this.province,
    required this.status,
    required this.timeService,
  });

  Map<String, dynamic> toMap() {
    return {
      'carId': carId,
      'phone': phone,
      'province': province,
      'status': status,
      'timeService': timeService,
    };
  }

  factory ReceiveModel.fromMap(Map<String, dynamic> map) {
    return ReceiveModel(
      carId: map['carId'] ?? '',
      phone: map['phone'] ?? '',
      province: map['province'] ?? '',
      status: map['status'] ?? '',
      timeService: (map['timeService']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReceiveModel.fromJson(String source) => ReceiveModel.fromMap(json.decode(source));
}
