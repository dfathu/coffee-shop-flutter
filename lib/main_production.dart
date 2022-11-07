import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_1/flavor_config.dart';

import 'myapp.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.prod,
    color: Colors.blue,
    values: const FlavorValues(
      titleApp: "Production App",
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}
