import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print("The current logged in user have the email : ");
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                }),
          ],
          title: const Text("⚡️ Chat"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(firestore: _firestore, user: loggedInUser),
              Container(
                decoration: keyMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser!.email,
                        });
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({
    super.key,
    required FirebaseFirestore firestore,
    required User? user,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent));
          }
          final messages = snapshot.data!.docs.reversed;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final data = message.data() as Map;
            final messageText = data['text'];
            final messageSender = data['sender'];
            final currentUser = loggedInUser!.email;
            bool mainUser = false;
            if (currentUser == messageSender) {
              mainUser = true;
            }
            final messageBubble = MessageBubble(
                sender: messageSender, text: messageText, mainUser: mainUser);
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  // This is how messages appear in the chat in the chat screen of the app;
  String? sender;
  String? text;
  bool mainUser;

  MessageBubble({super.key, this.sender, this.text, required this.mainUser});
  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment _axis = CrossAxisAlignment.end;
    Color _color = Colors.lightBlueAccent;
    BorderRadius _borderRadius = BorderRadius.only(
        bottomLeft: Radius.circular(30),
        topLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0));

    if (!mainUser) {
      _axis = CrossAxisAlignment.start;
      _color = Colors.amber;
      _borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0));
    }
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment:
              mainUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          // crossAxisAlignment: _axis,
          children: <Widget>[
            Text(
              sender!,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.0,
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: _borderRadius,
              color: _color,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
