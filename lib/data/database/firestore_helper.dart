import 'package:asartha/data/model/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper {
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
      });
    } catch (e) {
      print(e);
    }
  }
}
