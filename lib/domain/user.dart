
import 'dart:math';

import 'package:anif_admin/lib/head.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  final String _name;
  final String? _islandName;
  bool _isOnline;

  String get name => _name;
  bool get isOnline => _isOnline;
  String? get islandName => _islandName;

  set isOnline(bool value) {
    _isOnline = value;
    notifyListeners();
  }

  User(this._name, this._isOnline, this._islandName);

  Future<Image> createHeadImage(int size) async => createImage(this, size);
}

class UserViewModel {
  final List<User> _users = [];

  List<User> get users => _users;

  UserViewModel() {
    for (var i = 0; i < 30; i++) {
      _users.add(User('Doiche', Random().nextBool(), Random().nextBool() ? "Doiche's Island" : null));
    }
  }
}