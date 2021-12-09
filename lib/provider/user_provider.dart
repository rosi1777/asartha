import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileProvider(String id) {
    getUserProfile(id);
  }

  final UserFirestoreHelper fireStoreHelper = UserFirestoreHelper();

  late UserProfile _userProfile;
  late ResultState _state;
  // String _message = '';

  UserProfile get userProfile => _userProfile;
  ResultState get state => _state;

  Future<dynamic> getUserProfile(String id) async {
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

  Future<void> updateUserProfile(
      String id, String name, String email, int number) async {
    try {
      _state = ResultState.loading;

      notifyListeners();

      await fireStoreHelper.updateUserData(id, name, email, number);
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
