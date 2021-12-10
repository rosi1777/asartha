import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class VacancyProvider extends ChangeNotifier {
  final fireStoreHelper = VacancyFirestoreHelper();

  late ResultState _state;
  late VacancyResult _vacancy;

  VacancyResult get vacancy => _vacancy;
  ResultState get state => _state;

  Future<dynamic> getUserVacancy(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var userVacancy = await fireStoreHelper.getUserVacancy(id);

      _state = ResultState.done;
      notifyListeners();
      return _vacancy = userVacancy;
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
