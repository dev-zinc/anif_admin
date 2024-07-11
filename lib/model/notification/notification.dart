
import 'package:anif_admin/model/notification/notification_type.dart';
import 'package:anif_admin/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  final int id;
  final Map<String, dynamic> user;
  final List<NotificationType> notificationTypes;
  final String title;
  final DateTime createdDateTime;
  final String discordUrl;

  // int get id => _id;
  User get userObject => User.fromJson(user);
  // List<NotificationType> get notificationTypes => _notificationTypes;
  // String get title => _title;
  // DateTime get createdDateTime => _createdDateTime;
  // String get discordUrl => _discordUrl;
  // bool get isRead => _isRead;

  Notification(
    this.id,
    this.user,
    this.notificationTypes,
    this.title,
    this.createdDateTime,
    this.discordUrl
  );

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  bool isSolved() {
    return notificationTypes.contains(NotificationType.solved);
  }

  Duration computePassedTime() {
    return DateTime.now().difference(createdDateTime);
  }
}

