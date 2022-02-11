import 'package:flutter/foundation.dart';

class UserPref {
  final DateTime date;
  final String place;
  final String sex;
  final String age;
  final String religion;
  final String party;

  UserPref(
      this.date, this.place, this.sex, this.age, this.religion, this.party);

  factory UserPref.fromJson(Map<dynamic, dynamic> json) {
    return UserPref(
        DateTime.parse(json['date']),
        json['place'] as String,
        json['place'] as String,
        json['place'] as String,
        json['place'] as String,
        json['place'] as String);
  }
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'place': place.toString(),
        'sex': sex,
        'age': age,
        'religion': religion,
        'party': party,
      };
}
