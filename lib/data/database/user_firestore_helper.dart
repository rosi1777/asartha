import 'package:asartha/data/model/address.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserProfile> getUserProfileData(String id) async {
    var userProfile = await _firestore
        .collection('users')
        .doc(id)
        .collection('profile')
        .where('id', isEqualTo: id)
        .get();
    return UserProfile.fromMap(userProfile);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserVacancy(String id) async {
    return await _firestore
        .collection('users')
        .doc(id)
        .collection('vacancy')
        .get();
  }

  Future<void> addUserData(
      String email, String id, String name, int number) async {
    try {
      await _firestore
          .collection('users')
          .doc(id)
          .collection('profile')
          .doc()
          .set({
        'id': id,
        'name': name,
        'email': email,
        'phone_number': number,
        'role': 'User'
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUserData(
      String id, String name, String email, int number) async {
    var _auth = FirebaseAuth.instance;
    var user = _auth.currentUser;
    try {
      await _firestore
          .collection('users')
          .doc(id)
          .collection('profile')
          .where('id', isEqualTo: id)
          .get()
          .then((value) async {
        var docs = value.docs[0].id;
        print(docs);
        try {
          await _firestore
              .collection('users')
              .doc(id)
              .collection('profile')
              .doc(docs)
              .update({'name': name, 'email': email, 'phone_number': number});

          await user?.updateEmail(email);
        } catch (e) {
          print(e);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addAddressData(String addressOf, String id, String name,
      String address, String city, int postCode, int phone) async {
    try {
      await _firestore
          .collection('users')
          .doc(id)
          .collection('address')
          .doc()
          .set({
        'id': id,
        'addressOf': addressOf,
        'name': name,
        'address': address,
        'city': city,
        'postCode': postCode,
        'phone': phone,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Address> getAddressData(String id) async {
    var address = await _firestore
        .collection('users')
        .doc(id)
        .collection('address')
        .where('id', isEqualTo: id)
        .get();
    return Address.fromMap(address);
  }
}
