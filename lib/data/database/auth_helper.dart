import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/widget/floating_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  final _auth = FirebaseAuth.instance;

  Future<void> userLogin(
      String email, String password, BuildContext context, bool partner) async {
    try {
      await _auth.sign
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, FloatingNavigationBar.routeName,
          arguments: partner);
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> userRegister(
      String email, String password, String name, int number) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var resultUser = result.user;
    var id = resultUser?.uid;
    await UserFirestoreHelper().addUserData(email, id!, name, number);
  }

  Future<void> partnerLogin(
      String email, String password, BuildContext context, bool partner) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, FloatingNavigationBar.routeName,
          arguments: partner);
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> partnerRegister(String email, String password, String name,
      int number, String role) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var resultUser = result.user;
    var id = resultUser?.uid;
    await PartnerFirestoreHelper()
        .addPartnerData(email, id!, name, number, role);
  }
}
