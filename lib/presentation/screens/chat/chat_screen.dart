import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';
import 'package:flutter_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:flutter_yes_no_app/presentation/widgets/chat/in_message_bubble.dart';
import 'package:flutter_yes_no_app/presentation/widgets/chat/out_message_bubble.dart';
import 'package:flutter_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  final String srcImage =
      'https://imgs.search.brave.com/bnEV6NC-ixBwHNIDTef9UnMx-Zg0XJRO4Bxgq8Kr1AE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2Y2LzQy/LzE5L2Y2NDIxOWY2/OTM0NTg3NjUyYzIx/ZDM2MzgyMTcxYjdi/LmpwZw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatScreen'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CircleAvatar(backgroundImage: NetworkImage(srcImage)),
        ),
      ),

      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  if (message.fromWho == FromWho.mine) {
                    return OutMessageBubble(message: message.text);
                  } else {
                    return InMessageBubble(message: message);
                  }
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
