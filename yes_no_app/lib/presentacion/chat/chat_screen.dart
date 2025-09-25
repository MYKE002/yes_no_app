import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/dominio/message.dart';
import 'package:yes_no_app/presentacion/chat/chat_provider.dart';
import 'package:yes_no_app/presentacion/widgets/my_message_bubble.dart';
import 'package:yes_no_app/presentacion/widgets/otros_message_buble.dart';
import 'package:yes_no_app/presentacion/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/1c/3e/0f/1c3e0f3b1a5e2e4f0f4f0e2b5c6d7e8f.jpg',
            ),
          ),
        ),
        title: const Text("Contacto 1 probando"),
        centerTitle: false,
      ), // AppBar

      body: _chatView(),
    );
  }
}
