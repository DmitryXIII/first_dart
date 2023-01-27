import 'package:flutter/foundation.dart';

logInDebug<T>(T message) {
  if (kDebugMode) {
    print(message.toString());
  }
}