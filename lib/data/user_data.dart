class UserPref {
  final DateTime date;
  final String place;
  final int sex;
  final int age;
  final int religion;
  final int party;

  UserPref(
      this.date, this.place, this.sex, this.age, this.religion, this.party);
  UserPref.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        place = json['place'] as String,
        sex = json['place'] as int,
        age = json['place'] as int,
        religion = json['place'] as int,
        party = json['place'] as int;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'place': place,
        'sex': sex,
        'age': age,
        'religion': religion,
        'party': party,
      };
}
