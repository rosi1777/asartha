import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class GetPartnerVacancyProvider extends ChangeNotifier {
  final String id;

  GetPartnerVacancyProvider({required this.id}) {
    _getRole(id);
  }

  final fireStoreHelper = VacancyFirestoreHelper();
  final partnerFirestoreHelper = PartnerFirestoreHelper();

  late ResultState _state;
  late VacancyResult _vacancy;

  VacancyResult get vacancy => _vacancy;
  ResultState get state => _state;

  Future<void> _getRole(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var partner = await partnerFirestoreHelper.getPartnerProfileData(id);
      if (partner.role == 'Asisten Rumah Tangga') {
        _getHouseMaidVacancyById(id);
      } else {
        _getBabySitterVacancy(id);
      }
    } catch (e) {
      _state = ResultState.error;
      print(e);
      notifyListeners();
    }
  }

  Future<dynamic> _getHouseMaidVacancyById(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var vacancys = await fireStoreHelper.getHouseMaidVacancyById(id);

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

  Future<dynamic> _getBabySitterVacancy(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var vacancys = await fireStoreHelper.getBabySitterVacancyById(id);

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
