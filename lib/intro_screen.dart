import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed('login');
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'مرحبا بكم',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
