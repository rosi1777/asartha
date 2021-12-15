import 'package:asartha/common/style.dart';
import 'package:asartha/provider/chat_provider.dart';
import 'package:asartha/provider/partner_provider.dart';
import 'package:asartha/ui/conversation_page.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Pesan',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Consumer<ChatProvider>(
                builder: (context, provider, _) {
                  if (provider.state == ResultState.loading) {
                    return const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (provider.state == ResultState.noData) {
                    return const Center(child: Text('no data'));
                  } else if (provider.state == ResultState.error) {
                    return const Center(child: Text('error'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.allChat.chats.length,
                      itemBuilder: (context, index) {
                        var chat = provider.allChat.chats[index];
                        return ChangeNotifierProvider(
                          create: (_) => PartnerProfileProvider(
                            chat.partner,
                          ),
                          child: Consumer<PartnerProfileProvider>(
                            builder: (context, partnerProvider, _) {
                              if (partnerProvider.state ==
                                  ResultState.loading) {
                                return const SizedBox();
                              } else if (partnerProvider.state ==
                                  ResultState.noData) {
                                return const Center(child: Text('no data'));
                              } else if (partnerProvider.state ==
                                  ResultState.error) {
                                return const Center(child: Text('error'));
                              } else {
                                return Column(
                                  children: [
                                    InkWell(
                                      child: ListTile(
                                        title: Text(partnerProvider
                                            .partnerProfile.name),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ConversationPage.routeName,
                                            arguments:
                                                partnerProvider.partnerProfile);
                                      },
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
