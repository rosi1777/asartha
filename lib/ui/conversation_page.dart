import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationPage extends StatefulWidget {
  final PartnerProfile partner;
  const ConversationPage({Key? key, required this.partner}) : super(key: key);

  static const String routeName = '/chat_page';

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  late User _activeUser;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _messageTextController = TextEditingController();

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
    return Scaffold(
      backgroundColor: snow,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: snow,
        title: Text(
          widget.partner.name,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Text('Nice'),
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
                        _activeUser.uid,
                        widget.partner.id,
                        _messageTextController.text,
                        _activeUser.uid);
                    _messageTextController.clear();
                  },
                  shape: const CircleBorder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }
}
