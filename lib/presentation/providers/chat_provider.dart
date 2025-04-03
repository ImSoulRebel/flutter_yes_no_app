import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final ScrollController scrollController = ScrollController();
  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty) {
      final newMessage = Message(fromWho: FromWho.mine, text: text);
      messages.add(newMessage);
      if (text.endsWith('?')) {
        final message = await receivedMessage();
        messages.add(message);
      }
      moveScrollToBottom();
      notifyListeners();
    }
  }

  Future<Message> receivedMessage() async {
    return await getYesNoAnswer.getAnswer();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
    );
  }
}
