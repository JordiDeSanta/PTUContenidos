import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sciencenotes/pages/course_page.dart';
import 'package:sciencenotes/pages/home_page.dart';
import 'package:sciencenotes/pages/pdf_page.dart';
import 'package:sciencenotes/pages/theme_page.dart';
import 'package:sciencenotes/providers/ad_state.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      title: 'Science Notes',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context) => HomePage(),
        'course': (BuildContext context) => CoursePage(),
        'theme': (BuildContext context) => ThemePage(),
        'content': (BuildContext context) => PDFPage(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0.0),
        accentColor: Colors.white,
        fontFamily: 'Louis',
      ),
    );
  }
}
