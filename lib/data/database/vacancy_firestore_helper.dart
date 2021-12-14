import 'package:asartha/data/model/vacancy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyFirestoreHelper {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUserHouseMaidVacancy(String userId, String partnerId,
      DateTime startDate, DateTime endDate, String criteria) async {
    await _firestore.collection('vacancy').doc().set(
      {
        'user': userId,
        'partner': partnerId,
        'start_date': startDate,
        'end_date': endDate,
        'criteria': criteria,
        'status': 'Dikirim',
        'role': 'Asisten Rumah Tangga'
      },
    );
  }

  Future<void> addUserBabySitterVacancy(String userId, String partnerId,
      DateTime startDate, DateTime endDate, String criteria) async {
    await _firestore.collection('vacancy').doc().set(
      {
        'user': userId,
        'partner': partnerId,
        'start_date': startDate,
        'end_date': endDate,
        'criteria': criteria,
        'status': 'Dikirim',
        'role': 'Baby Sitter'
      },
    );
  }

  Future<void> updatePartnerVacancy(String userId, String partnerId) async {
    QuerySnapshot querySnap = await _firestore
        .collection('vacancy')
        .where('user', isEqualTo: userId)
        .get();
    QueryDocumentSnapshot doc = querySnap.docs[0];
    DocumentReference docRef = doc.reference;

    await docRef.update({'partner': partnerId});
  }

  Future<VacancyResult> getUserVacancy(String id) async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('user', isEqualTo: id)
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  Future<VacancyResult> getHouseMaidVacancy() async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('role', isEqualTo: 'Asisten Rumah Tangga')
        .where('partner', isEqualTo: '')
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  Future<VacancyResult> getBabySitterVacancy() async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('role', isEqualTo: 'Baby Sitter')
        .where('partner', isEqualTo: '')
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  Future<VacancyResult> getPartnerVacancy(String id) async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('partner', isEqualTo: id)
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  // Future<VacancyResult> getBabySitterVacancyById(String id) async {
  //   var vacancy = await _firestore
  //       .collection('vacancy')
  //       .where('partnerId', isEqualTo: id)
  //       .get();

  //   return VacancyResult.fromMap(vacancy);
  // }

  // Future<VacancyResult> getHouseMaidVacancyById(String id) async {
  //   var vacancy = await _firestore
  //       .collection('vacancy')
  //       .where('partnerID', isEqualTo: id)
  //       .get();

  //   return VacancyResult.fromMap(vacancy);
  // }
}
