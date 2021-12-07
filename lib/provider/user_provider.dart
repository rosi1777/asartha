import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:flutter/foundation.dart';

enum ResultState { loading, noData, hasData, error }

class UserProfileProvider extends ChangeNotifier {
  UserProfileProvider(String id) {
    _getUserProfile(id);
  }

  final UserFirestoreHelper fireStoreHelper = UserFirestoreHelper();

  late UserProfile _userProfile;
  late ResultState _state;
  // String _message = '';

  UserProfile get userProfile => _userProfile;
  ResultState get state => _state;

  Future<dynamic> _getUserProfile(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final profileData = await fireStoreHelper.getUserProfileData(id);

      _state = ResultState.hasData;
      notifyListeners();
      return _userProfile = profileData;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
