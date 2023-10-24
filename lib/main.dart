import 'dart:async';
import 'package:flutter/material.dart';
import 'package:viewer/locator/locator.dart';
import 'app.dart';

FutureOr<void> main() async {
  setup();

  runApp(App());
}
