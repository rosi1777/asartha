import 'package:cloud_firestore/cloud_firestore.dart';

class PartnerProfile {
  final String name;
  final String email;
  final String phoneNumber;
  final String role;
  PartnerProfile(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.role});

  factory PartnerProfile.fromMap(QuerySnapshot collection) {
    var docs = collection.docs;
    var data = docs[0].data() as Map<String, dynamic>;
    return PartnerProfile(
        name: data['name'],
        email: data['email'],
        phoneNumber: data['phone_number'].toString(),
        role: data['role']);
  }
}
