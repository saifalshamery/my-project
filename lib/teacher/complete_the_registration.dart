import 'package:flutter/material.dart';
import 'package:teachers/widgets/register_form.dart';

class CompleteTheRegistration extends StatefulWidget {
  const CompleteTheRegistration({Key? key}) : super(key: key);

  @override
  State<CompleteTheRegistration> createState() =>
      _CompleteTheRegistrationState();
}

class _CompleteTheRegistrationState extends State<CompleteTheRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Center(
                      child: Text(
                        'تم التسجيل بنجاح ولاكن نحتاج بعض المعلومات لاكمال تسجيلك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Comp_Register(),
        ],
      ),
    ));
  }
}
