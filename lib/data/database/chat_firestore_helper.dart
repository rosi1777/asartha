import 'package:asartha/data/model/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirestoreHelper {
  final _firestore = FirebaseFirestore.instance;

  Future<void> checkRoomChat({
    required String userId,
    required String partnerId,
  }) async {
    final String docId = '$userId$partnerId';
    await _firestore.collection('chatRoom').doc(docId).get().then((value) {
      if (!value.exists) {
        createRommChat(userId: userId, partnerId: partnerId);
      }
    });
  }

  Future<void> createRommChat({
    required String userId,
    required String partnerId,
  }) async {
    final String docId = '$userId$partnerId';
    await _firestore
        .collection('chatRoom')
        .doc(docId)
        .set({'user': userId, 'partner': partnerId});
  }

  Future<AllChatDoc> getUserAllChats(String id) async {
    var allChat = await _firestore
        .collection('chatRoom')
        .where('user', isEqualTo: id)
        .get();

    return AllChatDoc.fromMap(allChat);
  }

  Future<AllChatDoc> getpartnerAllChats(String id) async {
    var allChat = await _firestore
        .collection('chatRoom')
        .where('partner', isEqualTo: id)
        .get();

    return AllChatDoc.fromMap(allChat);
  }

  Stream<List<Chat>> getUserChat(String docId) {
    return _firestore
        .collection('chatRoom')
        .doc(docId)
        .collection('chats')
        .orderBy('dateCreated', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((document) => Chat.fromMap(document))
            .toList());
  }

  Future<void> addChat(
      String userId, String partnerId, String message, String sender) async {
    final String docId = '$userId$partnerId';

    await _firestore.collection('chatRoom').doc(docId).collection('chats').add({
      'text': message,
      'sender': sender,
      'dateCreated': Timestamp.now(),
    });
  }
}
