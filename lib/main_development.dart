import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_1/flavor_config.dart';

import 'myapp.dart';

Future main() async {
  FlavorConfig(
    flavor: FlavorType.dev,
    color: Colors.orange,
    values: const FlavorValues(
      titleApp: "Development App",
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });

  runApp(const MyApp());
}
