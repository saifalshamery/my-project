import 'package:flutter/material.dart';
import 'package:teachers/intro_screen.dart';
import 'package:teachers/student/home_screen.dart';
import 'package:teachers/teacher/complete_the_registration.dart';
import 'package:teachers/teacher/login_screen.dart';
import 'package:teachers/teacher/register_screen.dart';
import 'intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],







      supportedLocales: [
        Locale('ar', 'AE'), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 22,
                color: Colors.black.withAlpha(160),
                fontWeight: FontWeight.bold),
            headline3:
                TextStyle(fontSize: 20, color: Colors.white.withAlpha(140)),
            headline4: TextStyle(fontSize: 16)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
      home: IntroScreen(),
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'complete_reg': (context) => CompleteTheRegistration(),
        'home': (context) => HomePage(),
       // 'ssss' : (context) => HomePage()
      },
    );
  }
}
