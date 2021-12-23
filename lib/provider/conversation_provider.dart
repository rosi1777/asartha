import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/chat.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/foundation.dart';

class ConversationProvider extends ChangeNotifier {
  final ChatFirestoreHelper fireStoreHelper = ChatFirestoreHelper();
  final String id;

  ConversationProvider({required this.id}) {
    _getAllUserChat(id);
  }

  late Stream<List<Chat>> _conversation;
  late ResultState _state;

  Stream<List<Chat>> get conversation => _conversation;
  ResultState get state => _state;

  Future<dynamic> _getAllUserChat(String docId) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      var conversations = fireStoreHelper.getUserChat(docId);

      _state = ResultState.done;
      notifyListeners();
      return _conversation = conversations;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
