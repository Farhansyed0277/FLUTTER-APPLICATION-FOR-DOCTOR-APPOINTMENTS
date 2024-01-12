import 'package:flutter/material.dart';
import 'package:manipal_enterprise/app.dart';
import 'package:manipal_enterprise/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDep();
  runApp(const App());
}
