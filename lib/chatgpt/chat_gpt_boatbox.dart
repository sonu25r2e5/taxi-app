import 'dart:async';

import 'package:ClimateChange/chatgpt/threedots.dart/threedots.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart'; //import chatgpt

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart'; //chatmaesage

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  ChatGPT? chatGPT;

  StreamSubscription? _subscription;

  bool _isTyping = false;

  @override
  void initState() {
    // TODO: implement initState    //initialize it
    super.initState();
    chatGPT = ChatGPT.instance;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _sendMessage() {
    ChatMessage message = ChatMessage(text: _controller.text, sender: "user");

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();
    final request = CompleteReq(
      prompt: message.text,
      model: kTranslateModelV3,
      max_tokens: 200,
    );

    _subscription = chatGPT!
        .builder(
          "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",
        )
        .onCompleteStream(request: request)
        .listen((response) {
      Vx.log(response!.choices[0].text);
      ChatMessage botMessage =
          ChatMessage(text: response.choices[0].text, sender: "bot");

      setState(() {
        _isTyping = false;
        _messages.insert(0, botMessage);
      });
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onSubmitted: (value) => _sendMessage(),
            controller: _controller,
            decoration:
                const InputDecoration.collapsed(hintText: 'Send a message'),
          ),
        ),
        IconButton(
          onPressed: () => _sendMessage(),
          icon: const Icon(Icons.send),
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AskMe'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    })),
            if (_isTyping) const ThreeDots(),
            const Divider(
              height: 10.0,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
