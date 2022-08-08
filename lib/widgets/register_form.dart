import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'original_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final items = [
    'اللغة العربية',
    'الرياضيات',
    'الفيزياء',
    'الاحياء',
    'الكيمياء',
    'العلوم',
    'التاريخ',
    'الجغرافياء',
    ''
  ];
  final items1 = ['ذكر', 'انثى'];
  String? subject;
  String? gender;
  late String address;
  late String about_teacher;
  late String name;
  late String email;
  late String phone;
  late String password;
  late String password2;
  final _formKey = GlobalKey<FormState>();
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) => name = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ادخل اسمك الكامل';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'الاسم الكامل',
              ),
              //obscureText: true,
            ),
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
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => phone = value,
              validator: (value) {
                if (value == null || value.length == 9) {
                  return 'ادخل ارقام هاتف مكونة من 9 ارقام ';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
              ),
              //obscureText: true,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'التخصص:',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            DropdownButton<String>(
              dropdownColor: Colors.white,
              focusColor: Colors.white,
              value: subject,
              iconSize: 30,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black54,
              ),
              isExpanded: true,
              items: items
                  .map((String item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => this.subject = value),
            ),
            Text(
              'الجنس:',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            DropdownButton<String>(
              dropdownColor: Colors.grey,
              focusColor: Colors.black54,
              value: gender,
              iconSize: 30,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black54,
              ),
              isExpanded: true,
              items: items1
                  .map((String item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => this.gender = value),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              ' العنوان:',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            TextFormField(
              onChanged: (value) => address = value,
              decoration: InputDecoration(
                labelText: 'العنوان',
              ),
              //obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'نبذة عن المعلم:',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            TextFormField(
              onChanged: (value) => about_teacher = value,
              decoration: InputDecoration(
                labelText: 'نبذة عن المعلم',
              ),
              // obscureText: true,
            ),
            SizedBox(
              height: 30,
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
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => password2 = value,
              validator: (value) {
                if (value == null || value.length < 6 || value != password) {
                  return 'كلمة المرور غير متطابقة';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'تاكيد كلمة المرور',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 40,
            ),
            OriginalButton(
              text: 'تسجيل',
              onPressed: () async {
                var us = await authBase.register(name, email, phone, password,
                    subject, gender, address, about_teacher);
                print(us);
                Navigator.of(context).pushNamed('home');
              },
              textColor: Colors.white,
              bgColor: Colors.blueAccent,
            ),
            SizedBox(
              height: 5,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              child: Text(
                'لدي حساب باالفعل!',
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comp_Register extends StatefulWidget {
  const Comp_Register({Key? key}) : super(key: key);

  @override
  State<Comp_Register> createState() => _Comp_RegisterState();
}

class _Comp_RegisterState extends State<Comp_Register> {
  final items = [
    'اللغة العربية',
    'الرياضيات',
    'الفيزياء',
    'الاحياء',
    'الكيمياء',
    'العلوم',
    'التاريخ',
    'الجغرافياء',
    ''
  ];
  final items1 = ['ذكر', 'انثى'];
  String? _subject;
  String? _gender;
  String _address = '', _about_teacher = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Text(
            'التخصص:',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          DropdownButton<String>(
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            value: _subject,
            iconSize: 30,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
            isExpanded: true,
            items: items
                .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ))
                .toList(),
            onChanged: (value) => setState(() => this._subject = value),
          ),
          Text(
            'الجنس:',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          DropdownButton<String>(
            dropdownColor: Colors.grey,
            focusColor: Colors.black54,
            value: _gender,
            iconSize: 30,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
            isExpanded: true,
            items: items1
                .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ))
                .toList(),
            onChanged: (value) => setState(() => this._gender = value),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ' العنوان:',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          TextFormField(
            onChanged: (value) => _address = value,
            decoration: InputDecoration(
              labelText: 'العنوان',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'نبذة عن المعلم:',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          TextFormField(
            onChanged: (value) => _about_teacher = value,
            decoration: InputDecoration(
              labelText: 'نبذة عن المعلم',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 30,
          ),
          OriginalButton(
            text: 'تسجيل',
            onPressed: () => Navigator.of(context).pushNamed('complete_reg'),
            textColor: Colors.white,
            bgColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
