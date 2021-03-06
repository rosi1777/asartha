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
  final String role;
  final String partner;
  final int price;
  final String review;
  final String docId;

  Vacancy(
      {required this.user,
      required this.startDate,
      required this.endDate,
      required this.criteria,
      required this.status,
      required this.role,
      required this.partner,
      required this.price,
      required this.review,
      required this.docId});

  factory Vacancy.fromMap(QueryDocumentSnapshot doc) {
    var documentId = doc.id;
    var attribute = doc.data() as Map<String, dynamic>;
    return Vacancy(
        user: attribute['user'],
        startDate: attribute['start_date'].toDate(),
        endDate: attribute['end_date'].toDate(),
        criteria: attribute['criteria'],
        status: attribute['status'],
        role: attribute['role'],
        partner: attribute['partnerId'],
        price: attribute['price'],
        review: attribute['review'],
        docId: documentId);
  }
}
