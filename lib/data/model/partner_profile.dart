import 'package:cloud_firestore/cloud_firestore.dart';

class PartnerProfile {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String role;
  PartnerProfile(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.phoneNumber,
      required this.role});

  factory PartnerProfile.fromMap(QuerySnapshot collection) {
    var docs = collection.docs;
    var data = docs[0].data() as Map<String, dynamic>;
    return PartnerProfile(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        imageUrl: data['imageUrl'],
        phoneNumber: data['phone_number'].toString(),
        role: data['role']);
  }
}
