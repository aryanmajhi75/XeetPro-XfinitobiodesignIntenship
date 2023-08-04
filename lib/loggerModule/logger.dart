import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Logger {
  List<String> _logMessages = [];
  final DateFormat formatter = DateFormat('HH:mm:ss.SSS');

  // final logsStreamController = StreamController<List<String>>.broadcast();

  // StreamSink<List<String>> get logsSink => logsStreamController.sink;
  // Stream<List<String>> get logsStream => logsStreamController.stream;

  List<String> get messages => _logMessages;

  List<String> getLogs() {
    return _logMessages;
  }

  void log(String message) {
    if (_logMessages.length <= 10000) {
      if (kDebugMode) {
        // print(_logMessages.length);
        print(message);
      }
      _logMessages.add('${formatter.format(DateTime.now())} - $message');
      // logsSink.add(_logMessages);
    } else {
      _logMessages = [];
    }
  }

  void clearLogs() => _logMessages.clear();
}

Logger logger = Logger();
