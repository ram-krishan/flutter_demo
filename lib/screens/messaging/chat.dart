import 'package:flutter/material.dart';
import './messageCard.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  var input = TextEditingController();

  final List<Map<String, Object>> messages = [
    {
      "senderId": 1,
      "receiverId": 2,
      "text": "Hello",
      "sendAt": "10:00 AM",
    },
    {
      "senderId": 2,
      "receiverId": 1,
      "text": "Hi",
      "sendAt": "10:00 AM",
    },
    {
      "senderId": 1,
      "receiverId": 2,
      "text": "Kaise ho",
      "sendAt": "10:10 AM",
    },
    {
      "senderId": 1,
      "receiverId": 2,
      "text": "badiya or tum sunao...",
      "sendAt": "10:10 AM",
    },
    {
      "senderId": 2,
      "receiverId": 1,
      "text":
          "lorem ipsum is the greates lognes line goes here for dummy purpose",
      "sendAt": "10:10 AM",
    },
  ];

  void addNewMessage(text) {
    setState(() {
      messages.add({
        "senderId": 1,
        "receiverId": 2,
        "text": text,
        "sendAt": "10:10 AM",
      });
    });
    input.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 135,
              child: ListView.builder(
                itemBuilder: (BuildContext ctx, index) =>
                    MessageCard(messages.reversed.toList()[index]),
                itemCount: messages.length,
                reverse: true,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(30.0)),
                        color: Colors.white),
                    child: TextField(
                      controller: input,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                          suffixIcon: InkWell(
                            child: Icon(Icons.send),
                            onTap: () => addNewMessage(input.text),
                          )),
                      onSubmitted: addNewMessage,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
