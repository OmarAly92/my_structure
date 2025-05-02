import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration _delay;
  Timer? _timer;

  Debouncer({required Duration delay}) : _delay = delay;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(_delay, action);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  bool get isActive => _timer?.isActive ?? false;
}
