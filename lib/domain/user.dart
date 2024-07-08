
import 'package:anif_admin/lib/head.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  final String _name;

  String get name => _name;

  User(this._name);

  Future<Image> createHeadImage(int size) async => createImage(this, size);
}

class UserViewModel {

}