import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/chat.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  final ChatFirestoreHelper fireStoreHelper = ChatFirestoreHelper();
  final String id;
  final bool partner;

  ChatProvider({required this.id, required this.partner}) {
    _checkRole();
  }

  late AllChatDoc _allChatDoc;
  late ResultState _state;

  AllChatDoc get allChat => _allChatDoc;
  ResultState get state => _state;

  void _checkRole() {
    if (partner) {
      _getAllPartnerChat(id);
    } else {
      _getAllUserChat(id);
    }
  }

  Future<dynamic> _getAllUserChat(String userId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var allChats = await fireStoreHelper.getUserAllChats(userId);

      if (allChats.chats.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _allChatDoc = allChats;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<dynamic> _getAllPartnerChat(String partnerId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var allChats = await fireStoreHelper.getpartnerAllChats(partnerId);

      if (allChats.chats.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _allChatDoc = allChats;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
