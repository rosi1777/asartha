import 'package:asartha/data/model/vacancy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyFirestoreHelper {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUserHouseMaidVacancy(String userId, DateTime startDate,
      DateTime endDate, String criteria, int price) async {
    await _firestore.collection('vacancy').doc().set(
      {
        'user': userId,
        'partnerId': '',
        'start_date': startDate,
        'end_date': endDate,
        'price': price,
        'criteria': criteria,
        'status': 'Dikirim',
        'role': 'Asisten Rumah Tangga',
        'review': ''
      },
    );
  }

  Future<void> addUserBabySitterVacancy(String userId, DateTime startDate,
      DateTime endDate, String criteria, int price) async {
    await _firestore.collection('vacancy').doc().set(
      {
        'user': userId,
        'partnerId': "",
        'start_date': startDate,
        'end_date': endDate,
        'price': price,
        'criteria': criteria,
        'status': 'Dikirim',
        'role': 'Baby Sitter',
        'review': ''
      },
    );
  }

  Future<void> updatePartnerVacancy(
      String userId, String partnerId, String docId) async {
    await _firestore
        .collection('vacancy')
        .doc(docId)
        .update({'partnerId': partnerId, 'status': 'Diterima'});
  }

  Future<void> updateStatusVacancy(String docId) async {
    await _firestore
        .collection('vacancy')
        .doc(docId)
        .update({'status': 'Selesai'});
  }

  Future<void> updateRevviewVacancy(String docId, String review) async {
    await _firestore
        .collection('vacancy')
        .doc(docId)
        .update({'review': review});
  }

  Future<void> deleteVacancy(String docId) async {
    await _firestore.collection('vacancy').doc(docId).delete();
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
        .where('partnerId', isEqualTo: '')
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  Future<VacancyResult> getBabySitterVacancy() async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('role', isEqualTo: 'Baby Sitter')
        .where('partnerId', isEqualTo: '')
        .get();

    return VacancyResult.fromMap(vacancy);
  }

  Future<VacancyResult> getPartnerVacancy(String id) async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('partnerId', isEqualTo: id)
        .get();

    return VacancyResult.fromMap(vacancy);
  }
}
