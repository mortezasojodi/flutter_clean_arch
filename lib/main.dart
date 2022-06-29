import 'package:flutter/material.dart';
import 'package:fluttertest/app/core/injection.dart';
import 'package:fluttertest/presentation/App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

initServices() async {
  print('starting services ...');
  await injector();
  print('All services started...');
}
