
String formatDuration(Duration time) {
  if(time.inDays > 0) {
    switch(time.inDays) {
      case 1:
        return '어제';
      case 2:
        return '그저께';
      default:
        return '${time.inDays}일 전';
    }
  } else if(time.inHours > 0) {
    return '${time.inHours}시간 전';
  } else if(time.inMinutes > 0) {
    return '${time.inMinutes}분 전';
  }

  return '방금 전';
}