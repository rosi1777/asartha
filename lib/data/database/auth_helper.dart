import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/utils/constant.dart';
import 'package:asartha/utils/shared_preferences_utils.dart';
import 'package:asartha/widget/custom_snackbar.dart';
import 'package:asartha/widget/floating_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  final _customSnackbar = CustomSnackbar();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> userRegister(String email, String password, String name,
      int number, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var resultUser = result.user;
      var id = resultUser?.uid;
      await UserFirestoreHelper().addUserData(email, id!, name, number);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          _customSnackbar.showSnackbar('Email Sudah Terdaftar', context);
          break;
      }
    }
  }

  Future<void> partnerRegister(String email, String password, String name,
      int number, String role, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var resultUser = result.user;
      var id = resultUser?.uid;
      await PartnerFirestoreHelper()
          .addPartnerData(email, id!, name, number, role);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          _customSnackbar.showSnackbar('Email Sudah Terdaftar', context);
          break;
      }
    }
  }

  Future<void> userLogin(
      String email, String password, BuildContext context, bool partner) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((result) async {
        try {
          var firebaseUser = FirebaseAuth.instance.currentUser;
          await _firestore
              .collection('users')
              .doc(firebaseUser?.uid)
              .collection('profile')
              .get()
              .then((value) async {
            var role = value.docs[0]['role'];
            if (role == "User") {
              await PreferenceHelperFunctions.saveUserImageSharedPreference(
                  value.docs[0]['imageUrl']);
              Constant.userImage = await PreferenceHelperFunctions
                  .getUserImageSharedPreference();

              Navigator.pushReplacementNamed(
                  context, FloatingNavigationBar.routeName,
                  arguments: partner);
            }
          });
        } catch (e) {
          const message =
              'Email Telah Terdaftar Sebagai Partner, Silahkan Sign In Sebagai Partner';
          _customSnackbar.showSnackbar(message, context);
        }
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "wrong-password":
          const message = 'Email atau Pasword Salah';
          _customSnackbar.showSnackbar(message, context);
          break;
        case "invalid-email":
          const message = 'Periksa Email Anda dan coba lagi';
          _customSnackbar.showSnackbar(message, context);
          break;
        case "network-request-failed":
          const message = 'Periksa Koneksi Internet Anda dan Coba Lagi';
          _customSnackbar.showSnackbar(message, context);

          break;
        case "user-not-found":
          const message = 'Email dan Pasword Belum Terdaftar Sebagai Partner';
          _customSnackbar.showSnackbar(message, context);
          break;
      }
    }
  }

  Future<void> partnerLogin(
      String email, String password, BuildContext context, bool partner) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((result) async {
        try {
          var firebaseUser = FirebaseAuth.instance.currentUser;
          await _firestore
              .collection('partners')
              .doc(firebaseUser?.uid)
              .collection('profile')
              .get()
              .then((value) async {
            var role = value.docs[0]['role'];
            if (role != "User") {
              await PreferenceHelperFunctions.savePartnerImageSharedPreference(
                  value.docs[0]['imageUrl']);
              Constant.partnerImage = await PreferenceHelperFunctions
                  .getPartnerImageSharedPreference();
              Navigator.pushReplacementNamed(
                  context, FloatingNavigationBar.routeName,
                  arguments: partner);
            }
          });
        } catch (e) {
          const message =
              'Email Telah Terdaftar Sebagai User, Silahkan Sign In Sebagai User';
          _customSnackbar.showSnackbar(message, context);
        }
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "wrong-password":
          const message = 'Email atau Pasword Salah';
          _customSnackbar.showSnackbar(message, context);
          break;
        case "invalid-email":
          const message = 'Periksa Email Anda dan coba lagi';
          _customSnackbar.showSnackbar(message, context);
          break;
        case "network-request-failed":
          const message = 'Periksa Koneksi Internet Anda dan Coba Lagi';
          _customSnackbar.showSnackbar(message, context);

          break;
        case "user-not-found":
          const message = 'Email dan Pasword Belum Terdaftar Sebagai Partner';
          _customSnackbar.showSnackbar(message, context);
          break;
      }
    }
  }
}
