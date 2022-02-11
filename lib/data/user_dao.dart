import 'package:firebase_database/firebase_database.dart';
import 'user_data_toshow.dart';

class UserDao {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref().child('user-pref');
  void saveMessage(UserPref userPref) {
    _messagesRef.push().set(userPref.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef;
  }
}
