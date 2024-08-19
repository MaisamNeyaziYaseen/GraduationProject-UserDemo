import 'package:mongo_dart/mongo_dart.dart';
import 'package:user_demo/model/initial_diagnosis.dart';
import 'appointment.dart';
import 'diagnosis.dart';
import 'location_info.dart';

class User {
  ObjectId? id;
  String? firstName;
  String? lastName;
  String? username;
  DateTime? birthDate;
  String? gender;
  String? phoneNumber;
  String? email;
  List<LocationInfo>? locationInfo;
  List<Appointment>? appointments;
  List<InintialDiagnosis>? initialDiagnoses;
  List<Diagnosis>? diagnoses;
  Set<ObjectId>? wishList = {};
  Set<Map<String, dynamic>>? cartList = {};

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.birthDate,
      this.gender,
      this.phoneNumber,
      this.email,
      this.locationInfo,
      this.appointments,
      this.initialDiagnoses,
      this.diagnoses,
      this.wishList,
      this.cartList});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    if (json['location_info'] != null) {
      locationInfo = <LocationInfo>[];
      json['location_info']
          .forEach((e) => locationInfo!.add(LocationInfo.fromJson(e)));
    }
    if (json['appointments'] != null) {
      appointments = <Appointment>[];
      json['appointments'].forEach((e) => Appointment.fromJson(e));
    }
    if (json['initial_diagnoses'] != null) {
      initialDiagnoses = <InintialDiagnosis>[];
      json['initial_diagnoses']
          .forEach((e) => initialDiagnoses!.add(InintialDiagnosis.fromJson(e)));
    }
    if (json['diagnoses'] != null) {
      diagnoses = <Diagnosis>[];
      json['diagnoses'].forEach((e) => diagnoses!.add(Diagnosis.fromJson(e)));
    }
    if (json['wish_list'] != null) {
      wishList = <ObjectId>{};
      json['wish_list'].forEach((e) => wishList!.add(e));
    }
    if (json['cart_list'] != null) {
      cartList = <Map<String, dynamic>>{};
      json['cart_list'].forEach((e) {
        cartList!.add(e);
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (id != null) {
      data['_id'] = id;
    }
    if (firstName != null) {
      data['first_name'] = firstName;
    }
    if (lastName != null) {
      data['last_name'] = lastName;
    }
    if (username != null) {
      data['username'] = username;
    }
    if (birthDate != null) {
      data['birth_date'] = birthDate;
    }
    if (gender != null) {
      data['gender'] = gender;
    }
    if (phoneNumber != null) {
      data['phone_number'] = phoneNumber;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (locationInfo != null) {
      data['location_info'] = locationInfo!.map((e) => e.toJson()).toList();
    }
    if (appointments != null) {
      data['appointments'] = appointments!.map((e) => e.toJson).toList();
    }
    if (initialDiagnoses != null) {
      data['initial_diagnoses'] =
          initialDiagnoses!.map((e) => e.toJson()).toList();
    }
    if (diagnoses != null) {
      data['diagnoses'] = diagnoses!.map((e) => e.toJson()).toList();
    }
    if (wishList != null) {
      data['wish_list'] = wishList!.map((e) => e).toList();
    }
    if (cartList != null) {
      data['cart_list'] = cartList!.toList();
    }

    return data;
  }
}
