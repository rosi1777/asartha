import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class GetVacancyProvider extends ChangeNotifier {
  final String id;

  GetVacancyProvider({required this.id}) {
    _getUserVacancy(id);
  }
  final fireStoreHelper = VacancyFirestoreHelper();

  late ResultState _state;
  late VacancyResult _vacancy;

  VacancyResult get vacancy => _vacancy;
  ResultState get state => _state;

  Future<dynamic> _getUserVacancy(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var userVacancy = await fireStoreHelper.getUserVacancy(id);

      if (userVacancy.vacancy.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _vacancy = userVacancy;
      }
    } catch (e) {
      _state = ResultState.error;
      print(e);
      notifyListeners();
    }
  }
}
