import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      hintText: 'Write a message',
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textEditingController.value.text;
          onValue(textValue);
          textEditingController.clear();
        },
      ),
    );

    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (textValue) {
        onValue(textValue);
        textEditingController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
