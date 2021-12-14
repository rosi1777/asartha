import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class VacancyProvider extends ChangeNotifier {
  final fireStoreHelper = VacancyFirestoreHelper();

  late ResultState _state = ResultState.done;

  ResultState get state => _state;

  Future<void> addVacancy(
    String userId,
    String partnerId,
    DateTime startDate,
    DateTime endDate,
    String criteria,
  ) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await fireStoreHelper.addUserHouseMaidVacancy(
        userId,
        partnerId,
        startDate,
        endDate,
        criteria,
      );
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
