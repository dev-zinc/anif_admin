// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      (json['id'] as num).toInt(),
      json['user'] as Map<String, dynamic>,
      (json['notificationTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$NotificationTypeEnumMap, e))
          .toList(),
      json['title'] as String,
      DateTime.parse(json['createdDateTime'] as String),
      json['discordUrl'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'notificationTypes': instance.notificationTypes
          .map((e) => _$NotificationTypeEnumMap[e]!)
          .toList(),
      'title': instance.title,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'discordUrl': instance.discordUrl
    };

const _$NotificationTypeEnumMap = {
  NotificationType.reportingBugOrIssue: 'REPORTING_BUG_OR_ISSUE',
  NotificationType.suggestion: 'SUGGESTION',
  NotificationType.reportingUser: 'REPORTING_USER',
  NotificationType.inquiry: 'INQUIRY',
  NotificationType.others: 'OTHERS',
  NotificationType.solved: 'SOLVED',
};
