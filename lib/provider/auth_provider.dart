import 'package:asartha/data/database/auth_helper.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final auth = AuthHelper();
  ResultState _state = ResultState.done;
  ResultState get state => _state;

  Future<void> userSignIn(
      String email, String password, context, partner) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await auth.userLogin(email, password, context, partner);

      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> userRegister(String email, String password, String name,
      int number, BuildContext context) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await auth.userRegister(email, password, name, number, context);

      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> partnerSignIn(
      String email, String password, context, partner) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await auth.partnerLogin(email, password, context, partner);

      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> partnerRegister(String email, String password, String name,
      int number, String role, BuildContext context) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      await auth.partnerRegister(email, password, name, number, role, context);

      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
