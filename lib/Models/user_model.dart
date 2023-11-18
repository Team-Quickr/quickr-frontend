import 'package:flutter/cupertino.dart';

class User {
  final String uuid;
  final String username;
  final String email;
  final List<String> discoveries;

  const User({
    required this.uuid,
    required this.username,
    required this.email,
    required this.discoveries,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      username: json['username'],
      email: json['email'],
      discoveries: json['discoveries']
    );
  }
}

class UserModel extends ChangeNotifier {
  User? _currentUser;

  User? getUser() {
    return _currentUser;
  }

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  List<String> getCurrentJournal() {
    if(_currentUser == null) {
      throw Exception("Not Logged in!");
    }
    return _currentUser!.discoveries;
  }

}