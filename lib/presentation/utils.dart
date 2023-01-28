import 'package:flutter/foundation.dart';

void logInDebug<T>(T message) {
  if (kDebugMode) {
    print(message.toString());
  }
}