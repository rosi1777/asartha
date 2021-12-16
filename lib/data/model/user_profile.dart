import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  UserProfile(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.phoneNumber});

  factory UserProfile.fromMap(QuerySnapshot collection) {
    var docs = collection.docs;
    var data = docs[0].data() as Map<String, dynamic>;
    return UserProfile(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      imageUrl: data['imageUrl'],
      phoneNumber: data['phone_number'].toString(),
    );
  }
}
