import 'package:asartha/data/model/vacancy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyFirestoreHelper {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUserVacancy(
      String id, DateTime startDate, DateTime endDate, String criteria) async {
    await _firestore.collection('vacancy').doc().set(
      {
        'user': id,
        'start_date': startDate,
        'end_date': endDate,
        'criteria': criteria,
        'status': 'unaccepted'
      },
    );
  }

  Future<VacancyResult> getUserVacancy(String id) async {
    var vacancy = await _firestore
        .collection('vacancy')
        .where('user', isEqualTo: id)
        .get();

    return VacancyResult.fromMap(vacancy);
  }
}
