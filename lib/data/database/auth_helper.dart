import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/widget/floating_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> userLogin(
      String email, String password, BuildContext context, bool partner) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((result) {
        var firebaseUser = FirebaseAuth.instance.currentUser;

        _firestore
            .collection('users')
            .doc(firebaseUser?.uid)
            .collection('profile')
            .get()
            .then((value) {
          var role = value.docs[0]['role'];
          if (role == "User") {
            Navigator.pushReplacementNamed(
                context, FloatingNavigationBar.routeName,
                arguments: partner);
          } else {
            const snackBar = SnackBar(
              content: Text('Email atau password salah'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      });
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
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((result) {
        var firebaseUser = FirebaseAuth.instance.currentUser;

        _firestore
            .collection('partners')
            .doc(firebaseUser?.uid)
            .collection('profile')
            .get()
            .then((value) {
          var role = value.docs[0]['role'];
          if (role != "User") {
            Navigator.pushReplacementNamed(
                context, FloatingNavigationBar.routeName,
                arguments: partner);
          } else {
            const snackBar = SnackBar(
              content: Text('Email atau password salah'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      });
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
