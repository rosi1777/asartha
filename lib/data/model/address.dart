import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  final String id;
  final String addressOf;
  final String name;
  final String address;
  final String city;
  final String postCode;
  final String phone;

  Address({
    required this.id,
    required this.addressOf,
    required this.name,
    required this.address,
    required this.city,
    required this.postCode,
    required this.phone,
  });

  factory Address.fromMap(QuerySnapshot collection) {
    var docs = collection.docs;
    var data = docs[0].data() as Map<String, dynamic>;
    return Address(
      id: data['id'],
      addressOf: data['addressOf'],
      name: data['name'],
      address: data['address'],
      city: data['city'],
      postCode: data['postCode'].toString(),
      phone: data['phone'].toString(),
    );
  }
}
