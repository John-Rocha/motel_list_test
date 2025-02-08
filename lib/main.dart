import 'package:flutter/material.dart';
import 'package:motel_list_test/app_widget.dart';
import 'package:motel_list_test/core/di/inject.dart';

Future<void> main() async {
  await inject();

  runApp(const AppWidget());
}
