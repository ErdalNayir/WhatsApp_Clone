import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Person.dart';
import 'package:whatsapp_clone/Views/homePage.dart';
import 'package:device_preview/device_preview.dart';

import 'Views/splash_screen.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder:(context)=> const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo",
    locale: DevicePreview.locale(context),
    useInheritedMediaQuery: true,
    builder: DevicePreview.appBuilder,
    theme: ThemeData(tabBarTheme: const TabBarTheme(indicator: UnderlineTabIndicator(borderSide:
    BorderSide(width:6.0,
        color:Colors.white ))),colorScheme: ColorScheme.fromSwatch(accentColor: Colors.teal.shade400)),
    routes:  {
      '/' : (context) => const SplashScreen(),
      '/anasayfa' : (context) => const HomePage(),
    }
    );
    //home: HomePage(persons: allPersons),);

  }
}

