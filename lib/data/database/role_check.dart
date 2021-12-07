// import 'package:cloud_firestore/cloud_firestore.dart';

// class CheckRole {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<bool> checkRole(String id) async {
//     var userProfile = await _firestore
//         .collection('users')
//         .doc(id)
//         .collection('profile')
//         .where('id', isEqualTo: id)
//         .get();

//     var docs = userProfile.docs;
//     var data = docs[0].data();
//     var role = data['role'] as String;

//     if (role == 'User') {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
