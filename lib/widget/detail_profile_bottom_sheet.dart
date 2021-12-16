import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/chat_firestore_helper.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:asartha/ui/user_conversation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailProfileBottomSheet extends StatelessWidget {
  final PartnerProfile partner;
  DetailProfileBottomSheet({Key? key, required this.partner}) : super(key: key);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var userId = _auth.currentUser?.uid;
    return Container(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 35),
      height: 562,
      width: MediaQuery.of(context).size.width,
      color: white,
      child: ListView(
        children: [
          Text(
            'Detail Profile',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 37,
          ),
          Text(
            'Nama',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            partner.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Email',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            partner.email,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'No Telepon',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            '0${partner.phoneNumber}',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                      child: Text(
                        'Tutup',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                      child: Text(
                        'Kirim Pesan',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, UserConversationPage.routeName,
                            arguments: partner);
                        ChatFirestoreHelper().checkRoomChat(
                            userId: userId!, partnerId: partner.id);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
