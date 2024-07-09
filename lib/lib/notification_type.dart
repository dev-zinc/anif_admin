
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

enum NotificationType {
  reportingBugOrIssue("버그 및 오류 제보"),
  suggestion("건의사항"),
  reportingUser("유저 신고"),
  inquiry("문의사항"),
  others("기타"),
  solved("해결됨");

  final String _displayName;

  String get displayName => _displayName;

  const NotificationType(String displayName) : _displayName = displayName;

  Widget createTypeBadge() => Container(
    margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: AnifColors.greyF2,
      border: Border.all(
          color: this != solved ? AnifColors.greyAA : AnifBlueColors.blueStroke,
          width: 2
      ),
      borderRadius: BorderRadius.circular(90)
    ),
    child: Text(
      displayName,
      softWrap: true,
      style: TextStyle(
          fontSize: 9,
          color: this != solved ? AnifColors.grey66 : AnifBlueColors.blueText,
          fontWeight: FontWeight.bold
      )
    ),
  );
}

class NotificationCounter {
  final Map<NotificationType, int> _typeMap = {
    NotificationType.reportingBugOrIssue: 0,
    NotificationType.suggestion: 0,
    NotificationType.reportingUser: 0,
    NotificationType.inquiry: 0,
    NotificationType.others: 0,
  };

  int total() {
    return _typeMap.values.fold(0, (prev, element) => prev + element);
  }

  int get(NotificationType type) => _typeMap[type]!;

  /// 더한 후 값 반환
  int add(NotificationType type, int amount) {
    int current = _typeMap[type]!;
    _typeMap[type] = current + amount;
    return _typeMap[type]!;
  }

  /// 뺀 후 값 반환
  int remove(NotificationType type, int amount) {
    int current = _typeMap[type]!;
    _typeMap[type] = current - amount;
    return _typeMap[type]!;
  }
}