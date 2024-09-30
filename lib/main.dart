import 'package:flutter/material.dart';
import 'package:offlinefirst/app/app_widget.dart';
import 'package:offlinefirst/app/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const AppWidget());
}
