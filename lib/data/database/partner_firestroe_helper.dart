import 'package:asartha/data/model/partner_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PartnerFirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PartnerProfile> getPartnerProfileData(String id) async {
    var partnerProfile = await _firestore
        .collection('partners')
        .doc(id)
        .collection('profile')
        .where('id', isEqualTo: id)
        .get();
    return PartnerProfile.fromMap(partnerProfile);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPartnerApplication(
      String id) async {
    return await _firestore
        .collection('partners')
        .doc(id)
        .collection('vacancy')
        .get();
  }

  Future<void> addPartnerData(
      String email, String id, String name, int number, String role) async {
    try {
      await _firestore
          .collection('partners')
          .doc(id)
          .collection('profile')
          .doc()
          .set({
        'id': id,
        'name': name,
        'email': email,
        'phone_number': number,
        'role': role
      });
    } catch (e) {
      print(e);
    }
  }
}
