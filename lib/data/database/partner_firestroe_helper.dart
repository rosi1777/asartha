import 'package:asartha/data/model/address.dart';
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

  Future<void> addAddressData(String addressOf, String id, String name,
      String address, String city, int postCode, int phone) async {
    try {
      await _firestore
          .collection('partners')
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
        .collection('partners')
        .doc(id)
        .collection('address')
        .where('id', isEqualTo: id)
        .get();
    return Address.fromMap(address);
  }
}
