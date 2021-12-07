import 'package:asartha/data/database/firestore_helper.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:flutter/foundation.dart';

enum ResultState { loading, noData, hasData, error }

class PartnerProfileProvider extends ChangeNotifier {
  PartnerProfileProvider(String id) {
    _getPartnerProfile(id);
  }

  final FireStoreHelper fireStoreHelper = FireStoreHelper();

  late PartnerProfile _partnerProfile;
  late ResultState _state;
  // String _message = '';

  PartnerProfile get partnerProfile => _partnerProfile;
  ResultState get state => _state;

  Future<dynamic> _getPartnerProfile(String id) async {
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
}
