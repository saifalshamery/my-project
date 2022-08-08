import 'package:flutter/material.dart';
import 'package:teachers/intro_screen.dart';
import 'package:teachers/student/home_screen.dart';
import 'package:teachers/teacher/complete_the_registration.dart';
import 'package:teachers/teacher/login_screen.dart';
import 'package:teachers/teacher/register_screen.dart';
import 'intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
            headline1: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 22,
                color: Colors.black.withAlpha(160),
                fontWeight: FontWeight.bold),
            headline3:
                TextStyle(fontSize: 20, color: Colors.white.withAlpha(140)),
            headline4: const TextStyle(fontSize: 16)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
      home: const IntroScreen(),
      routes: {
        'login': (context) => const LoginScreen(),
        'register': (context) => RegisterScreen(),
        'complete_reg': (context) => const CompleteTheRegistration(),
        'home': (context) => const HomePage(),

        // 'ssss' : (context) => HomePage()
      },
    );
  }
}
