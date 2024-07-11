
import 'package:anif_admin/lib/request_delay.dart';
import 'package:anif_admin/model/user/user.dart';
import 'package:anif_admin/service/user_service.dart';
import 'package:flutter/widgets.dart';

class UserViewModel extends ChangeNotifier with RequestDelay {
  final UserService _userService = UserService();
  late List<User> _users;

  List<User> get users => _users;

  // Future<User> fetchUser(String uuid) {
  //   return _userService.getUser(uuid);
  // }

  Future<List<User>> fetchUserList() async {
    if(isExpired(const Duration(seconds: 10))) {
      _users = await _userService.getUserList();
      notifyListeners();
    }
    return _users;
  }
}