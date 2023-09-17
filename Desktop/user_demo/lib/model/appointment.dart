import 'package:user_demo/model/diagnosis.dart';

import 'user.dart';

class Appointment {
  String? id;
  String? state;
  DateTime? dateTime;
  User? user;
  Diagnosis? diagnosis;

  //TODO: reconstruct Appointment class
  Appointment.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    return data;
  }
}
