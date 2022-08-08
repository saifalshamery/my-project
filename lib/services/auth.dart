import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  final String uid;

  User({required this.uid});
}

class AuthBase {
  User _userFromFirebase(user) {
    return User(uid: user.uid);
  }

  Future<User> register(
      String name,
      String email,
      String phone,
      String password,
      String? subject,
      String? gender,
      String address,
      String about_teacher) async {
    await FirebaseFirestore.instance.collection("users").add({
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "subject": subject,
      "gender": gender,
      "address": address,
      "aboutTeacher": about_teacher,
    });
    final authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(authResult.user);
  }

  Future<User> loginWithEmailAndPassword(String email, String password) async {
    final authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(authResult.user);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
