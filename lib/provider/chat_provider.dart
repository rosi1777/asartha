import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/chat.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  final ChatFirestoreHelper fireStoreHelper = ChatFirestoreHelper();
  final String id;

  ChatProvider({required this.id}) {
    _getAllUserChat(id);
  }

  late AllChatDoc _allChatDoc;
  late ResultState _state;

  AllChatDoc get allChat => _allChatDoc;
  ResultState get state => _state;

  Future<dynamic> _getAllUserChat(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var allChats = await fireStoreHelper.getUserAllChats(id);

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
      print(e);
      notifyListeners();
    }
  }
}
