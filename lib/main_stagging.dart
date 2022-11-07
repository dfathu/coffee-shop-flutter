import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_1/flavor_config.dart';

import 'myapp.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.stg,
    color: Colors.amber,
    values: const FlavorValues(
      titleApp: "Stagging App",
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}
