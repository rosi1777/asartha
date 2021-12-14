import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class GetAllVacancyProvider extends ChangeNotifier {
  final String id;

  GetAllVacancyProvider({required this.id}) {
    getRole(id);
  }

  final fireStoreHelper = VacancyFirestoreHelper();
  final partnerFirestoreHelper = PartnerFirestoreHelper();

  late ResultState _state;
  late VacancyResult _vacancy;

  VacancyResult get vacancy => _vacancy;
  ResultState get state => _state;

  Future<void> getRole(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var partner = await partnerFirestoreHelper.getPartnerProfileData(id);
      if (partner.role == 'Asisten Rumah Tangga') {
        _getHouseMaidVacancy();
      } else {
        _getBabySitterVacancy();
      }
    } catch (e) {
      _state = ResultState.error;
      print(e);
      notifyListeners();
    }
  }

  Future<dynamic> _getHouseMaidVacancy() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var vacancys = await fireStoreHelper.getHouseMaidVacancy();

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

  Future<dynamic> _getBabySitterVacancy() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var vacancys = await fireStoreHelper.getBabySitterVacancy();

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
