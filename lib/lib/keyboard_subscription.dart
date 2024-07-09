
import 'dart:async';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

mixin KeyboardSubscription {
  late final StreamSubscription<bool> _keyboardSubscription;

  void subscribeKeyboardEvent(Function(bool isVisible) handler) {
    _keyboardSubscription = KeyboardVisibilityController().onChange.listen(handler);
  }

  void cancelSubscription() {
    _keyboardSubscription.cancel();
  }

}