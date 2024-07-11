
mixin RequestDelay {
  DateTime _lastModified = DateTime.now().subtract(const Duration(hours: 1));

  bool isExpired(Duration duration) {
    final isExpired = DateTime.now().difference(_lastModified) > duration;

    if(isExpired) {
      _lastModified = DateTime.now();
    }

    return isExpired;
  }
}