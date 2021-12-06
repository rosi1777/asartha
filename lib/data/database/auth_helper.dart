import 'package:asartha/data/database/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final _auth = FirebaseAuth.instance;

  Future<void> userLogin(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> userRegister(
      String email, String password, String name, int number) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var resultUser = result.user;
    var id = resultUser?.uid;
    await FireStoreHelper().addUserData(email, id!, name, number);
  }

  Future<void> partnerLogin(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> partnerRegister(String email, String password, String name,
      int number, String role) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var resultUser = result.user;
    var id = resultUser?.uid;
    await FireStoreHelper().addPartnerData(email, id!, name, number, role);
  }
}
