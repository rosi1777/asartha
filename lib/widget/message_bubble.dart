import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final String imageurl;

  final bool isMyChat;
  final DateTime time;

  const MessageBubble(
      {Key? key,
      required this.sender,
      required this.text,
      required this.isMyChat,
      required this.time,
      required this.imageurl})
      : super(key: key);

  final senderBorderRadius = const BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );

  final otherBorderRadius = const BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          isMyChat
              ? const SizedBox()
              : Text(sender,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  )),
          isMyChat
              ? Material(
                  color: isMyChat ? Colors.lightBlue : Colors.white,
                  borderRadius:
                      isMyChat ? senderBorderRadius : otherBorderRadius,
                  elevation: 4.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMyChat
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          text,
                          style: TextStyle(
                            color: isMyChat ? Colors.white : Colors.black54,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 6),
                            child: Text(
                              DateFormat.Hm().format(time),
                              style: TextStyle(
                                  color: isMyChat ? black : grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        imageurl,
                        scale: 15,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Material(
                      color: isMyChat ? Colors.lightBlue : Colors.white,
                      borderRadius:
                          isMyChat ? senderBorderRadius : otherBorderRadius,
                      elevation: 4.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMyChat
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: isMyChat ? Colors.white : Colors.black54,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, bottom: 6),
                                child: Text(
                                  DateFormat.Hm().format(time),
                                  style: TextStyle(
                                      color: isMyChat ? black : grey,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
