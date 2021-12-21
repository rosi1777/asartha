import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class GetPartnerVacancyProvider extends ChangeNotifier {
  final String id;

  GetPartnerVacancyProvider({required this.id}) {
    _getPartnerVacancy(id);
  }

  final fireStoreHelper = VacancyFirestoreHelper();

  late ResultState _state;
  late VacancyResult _vacancy;

  VacancyResult get vacancy => _vacancy;
  ResultState get state => _state;

  Future<dynamic> _getPartnerVacancy(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var vacancys = await fireStoreHelper.getPartnerVacancy(id);

      if (vacancys.vacancy.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _vacancy = vacancys;
      }
    } catch (e) {
      _state = ResultState.error;
      print(e);
      notifyListeners();
    }
  }
}
