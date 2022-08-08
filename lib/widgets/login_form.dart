import 'package:flutter/material.dart';
import 'package:teachers/services/auth.dart';
import 'package:teachers/teacher/login_screen.dart';
import 'original_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  AuthBase authBase = AuthBase();
  //String _email = '', _password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              TextFormField(
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخل بريد الكتروني صالح';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'البريد الالكتروني',
                    hintText: 'ex: test@gmail.com'),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'ادخل كلمة مرور لا تقل عن 6 احرف';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              OriginalButton(
                text: 'دخول',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      authBase.loginWithEmailAndPassword(email, password);
                      Navigator.of(context).pushNamed('home');
                    } catch (e) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "خطأ لايوجد مستخدم بهذا الايميل الرجاء تسجيل حساب جديد"),
                          duration: Duration(seconds: 2)));
                    }
                  }
                },
                textColor: Colors.white,
                bgColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pushNamed('register'),
                child: Text(
                  'ليس لديك حساب؟ سجل الان',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
