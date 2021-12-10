import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyResult {
  final List<Vacancy> vacancy;

  VacancyResult({required this.vacancy});

  factory VacancyResult.fromMap(QuerySnapshot<Map<String, dynamic>> data) {
    return VacancyResult(
      vacancy: List<Vacancy>.from(
        data.docs.map(
          (e) => Vacancy.fromMap(e),
        ),
      ),
    );
  }
}

class Vacancy {
  final String user;
  final DateTime startDate;
  final DateTime endDate;
  final String criteria;
  final String status;

  Vacancy(
      {required this.user,
      required this.startDate,
      required this.endDate,
      required this.criteria,
      required this.status});

  factory Vacancy.fromMap(QueryDocumentSnapshot doc) {
    var attribute = doc.data() as Map<String, dynamic>;
    return Vacancy(
      user: attribute['user'],
      startDate: attribute['start_date'],
      endDate: attribute['end_date'],
      criteria: attribute['criteria'],
      status: attribute['status'],
    );
  }
}

