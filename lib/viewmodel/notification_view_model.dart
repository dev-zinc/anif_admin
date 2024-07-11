
import 'package:anif_admin/lib/request_delay.dart';
import 'package:anif_admin/model/notification/notification.dart' as model;
import 'package:anif_admin/service/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationViewModel extends ChangeNotifier with RequestDelay {
  final NotificationService _notificationService = NotificationService();
  List<model.Notification> _notifications = [];

  NotificationViewModel();

  factory NotificationViewModel.clone(NotificationViewModel notificationViewModel) {
    var notificationViewModel = NotificationViewModel();
    notificationViewModel._notifications = notificationViewModel._notifications;
    return notificationViewModel;
  }

  Future<List<model.Notification>> fetchNotificationList() async {
    if(isExpired(const Duration(seconds: 10))) {
      _notifications = await _notificationService.fetchNotificationList();
      notifyListeners();
    }
    return _notifications;
  }

  void read(SharedPreferences sharedPreferences, model.Notification notification) {
    sharedPreferences.setBool("notification:${notification.id}", true);
  }

  bool hasRead(SharedPreferences sharedPreferences, model.Notification notification) {
    return sharedPreferences.getBool("notification:${notification.id}") ?? false;
  }
}