import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/chat.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:asartha/widget/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartnerConversationPage extends StatefulWidget {
  final UserProfile user;
  const PartnerConversationPage({Key? key, required this.user})
      : super(key: key);

  static const String routeName = '/partner_chat_page';

  @override
  State<PartnerConversationPage> createState() =>
      _PartnerConversationPageState();
}

class _PartnerConversationPageState extends State<PartnerConversationPage> {
  late User _activeUser;
  final _auth = FirebaseAuth.instance;
  final _messageTextController = TextEditingController();
  final firebaseHelper = ChatFirestoreHelper();
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    try {
      var currentUser = _auth.currentUser;
      if (currentUser != null) {
        _activeUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var docId = '${widget.user.id}${_activeUser.uid}';

    return StreamProvider<List<Chat>>(
      create: (_) => firebaseHelper.getUserChat(docId),
      initialData: const [],
      builder: (ctx, child) {
        final chats = Provider.of<List<Chat>>(ctx);
        return Scaffold(
          backgroundColor: snow,
          appBar: AppBar(
            iconTheme: IconThemeData(color: black),
            backgroundColor: snow,
            title: Text(
              widget.user.name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      var chat = chats[index];
                      return MessageBubble(
                        sender: widget.user.name,
                        text: chat.message,
                        isMyChat: chat.sendBy == _activeUser.uid,
                        time: chat.time,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageTextController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                      color: Theme.of(context).primaryColor,
                      textTheme: ButtonTextTheme.primary,
                      onPressed: () {
                        ChatFirestoreHelper().addChat(
                            widget.user.id,
                            _activeUser.uid,
                            _messageTextController.text,
                            _activeUser.uid);
                        _messageTextController.clear();
                        _controller.animateTo(0.0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn);
                      },
                      shape: const CircleBorder(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }
}
