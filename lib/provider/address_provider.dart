import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:asartha/data/model/address.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class AddressProvider extends ChangeNotifier {
  AddressProvider(String id, bool partner) {
    getAddress(id, partner);
  }

  final UserFirestoreHelper userFireStoreHelper = UserFirestoreHelper();
  final PartnerFirestoreHelper partnerFireStoreHelper =
      PartnerFirestoreHelper();

  late Address _address;
  late ResultState _state;

  Address get address => _address;
  ResultState get state => _state;

  Future<dynamic> getAddress(String id, bool partner) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final addressData = partner
          ? await partnerFireStoreHelper.getAddressData(id)
          : await userFireStoreHelper.getAddressData(id);

      _state = ResultState.hasData;
      notifyListeners();
      return _address = addressData;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> updateAddress(
      String addressOf,
      String id,
      String name,
      String address,
      String city,
      int postCode,
      int phone,
      bool partner) async {
    try {
      _state = ResultState.loading;

      notifyListeners();

      partner
          ? await PartnerFirestoreHelper().updateAddressData(
              addressOf, id, name, address, city, postCode, phone)
          : await UserFirestoreHelper().updateAddressData(
              addressOf, id, name, address, city, postCode, phone);
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }

  Future<void> addAddress(
      String addressOf,
      String id,
      String name,
      String address,
      String city,
      int postCode,
      int phone,
      bool partner) async {
    try {
      _state = ResultState.loading;

      notifyListeners();

      partner
          ? await PartnerFirestoreHelper().addAddressData(
              addressOf, id, name, address, city, postCode, phone)
          : await UserFirestoreHelper().addAddressData(
              addressOf, id, name, address, city, postCode, phone);
      _state = ResultState.done;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
