import "package:flutter/material.dart";

class MessageCard extends StatelessWidget {
  final Map message;

  MessageCard(this.message);

  @override
  Widget build(BuildContext context) {
    bool isSender = message['senderId'] == 2;
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 4,
              bottom: 4,
              right: 5,
              left: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isSender ? 0 : 8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(isSender ? 8 : 0))),
            width: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    child: Text(
                  message['text'],
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    message['sendAt'],
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
