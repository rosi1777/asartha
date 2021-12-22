import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class PartnerProfileProvider extends ChangeNotifier {
  PartnerProfileProvider(String id) {
    getPartnerProfile(id);
  }

  final PartnerFirestoreHelper fireStoreHelper = PartnerFirestoreHelper();

  late PartnerProfile _partnerProfile;
  late ResultState _state;
  // String _message = '';

  PartnerProfile get partnerProfile => _partnerProfile;
  ResultState get state => _state;

  Future<dynamic> getPartnerProfile(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final profileData = await fireStoreHelper.getPartnerProfileData(id);

      _state = ResultState.hasData;
      notifyListeners();
      return _partnerProfile = profileData;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> updatePartnerProfile(
      String id, String name, String email, int number) async {
    try {
      _state = ResultState.loading;

      notifyListeners();

      await fireStoreHelper.updatePartnerData(id, name, email, number);
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
