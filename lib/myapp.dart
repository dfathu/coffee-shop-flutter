import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/bloc/onboard/onboardbloc.dart';
import 'package:test_1/flavor_config.dart';
import 'package:test_1/screen/onboard.dart';

import 'constant/routes.dart';
import 'screen/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  bool debugShowCheckedFunction() {
    if (FlavorConfig.instance.flavor.index == 3) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IndexinBloc>(
      create: (context) => IndexinBloc(0),
      child: MaterialApp(
        title: FlavorConfig.instance.values.titleApp,
        debugShowCheckedModeBanner: debugShowCheckedFunction(),
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: Routes.onBoarding,
        routes: {
          Routes.screenMain: (context) =>
              HomePage(flavor: FlavorConfig.instance.values.titleApp),
          Routes.onBoarding: (context) => OnBoardingScreen(),
        },
      ),
    );
  }
}
