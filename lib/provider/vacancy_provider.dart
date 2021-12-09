import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class VacancyProvider extends ChangeNotifier {
  final fireStoreHelper = VacancyFirestoreHelper();

  late ResultState _state;

  ResultState get state => _state;

  Future<void> updateUserProfile(String id, DateTime startDate,
      DateTime endDate, String criteria) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await fireStoreHelper.addUserVacancy(
          id, startDate, endDate, criteria);
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
