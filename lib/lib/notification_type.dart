
enum NotificationType {
  reportingBugOrIssue("버그 및 오류 제보"),
  suggestion("건의사항"),
  reportingUser("유저 신고"),
  inquiry("문의사항"),
  others("기타");

  final _displayName;

  const NotificationType(String displayName) : _displayName = displayName;

  String get displayName => _displayName;
}

class NotificationCounter {
  final Map<NotificationType, int> _typeMap = {
    NotificationType.reportingBugOrIssue: 0,
    NotificationType.suggestion: 0,
    NotificationType.reportingUser: 0,
    NotificationType.inquiry: 0,
    NotificationType.others: 0
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