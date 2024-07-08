
import 'dart:math';

import 'package:anif_admin/domain/user.dart';
import 'package:anif_admin/lib/notification_type.dart';

class Notification {
  final User _user;
  final Set<NotificationType> _notificationTypes;
  final String _title;
  final DateTime _createdDateTime;
  bool _isRead = false;

  User get user => _user;
  Set<NotificationType> get notificationTypes => _notificationTypes;
  String get title => _title;
  DateTime get createdDateTime => _createdDateTime;
  bool get isRead => _isRead;

  Notification(
    this._user,
    this._notificationTypes,
    this._title,
    this._createdDateTime,
    this._isRead
  );

  void read() {
    _isRead = true;
  }

  Duration computePassedTime() {
    return DateTime.now().difference(_createdDateTime);
  }
}

class NotificationViewModel {
  final List<Notification> _notifications = [];

  List<Notification> get notifications => _notifications;

  NotificationViewModel() {
    for (var i = 0; i < 30; i++) {
      _notifications.add(
        Notification(
          User('Doiche'),
          {
              NotificationType.values[Random().nextInt(5)],
              NotificationType.values[Random().nextInt(5)]
          },
          'test',
          DateTime.now().subtract(const Duration(hours: 3)),
          false
        )
      );
    }
  }
}

