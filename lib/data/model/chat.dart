import 'package:cloud_firestore/cloud_firestore.dart';

class AllChatDoc {
  final List<ChatDoc> chats;

  AllChatDoc({required this.chats});

  factory AllChatDoc.fromMap(QuerySnapshot<Map<String, dynamic>> data) {
    return AllChatDoc(
      chats: List<ChatDoc>.from(
        data.docs.map(
          (e) => ChatDoc.fromMap(e),
        ),
      ),
    );
  }
}

class ChatDoc {
  final String user;
  final String partner;

  ChatDoc({required this.user, required this.partner});
  factory ChatDoc.fromMap(QueryDocumentSnapshot doc) {
    var attribute = doc.data() as Map<String, dynamic>;
    return ChatDoc(
      user: attribute['user'],
      partner: attribute['partner'],
    );
  }
}

class ChatResult {
  final List<Chat> chat;

  ChatResult({required this.chat});

  factory ChatResult.fromMap(QuerySnapshot<Map<String, dynamic>> data) {
    return ChatResult(
      chat: List<Chat>.from(
        data.docs.map(
          (e) => Chat.fromMap(e),
        ),
      ),
    );
  }
}

class Chat {
  final String sendBy;
  final String message;
  final DateTime time;

  Chat({required this.sendBy, required this.message, required this.time});

  factory Chat.fromMap(QueryDocumentSnapshot doc) {
    var attribute = doc.data() as Map<String, dynamic>;
    return Chat(
      sendBy: attribute['sendBy'],
      message: attribute['message'],
      time: attribute['time'].toDate(),
    );
  }
}
