import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/config/theme/app_theme.dart';
import 'package:flutter_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:flutter_yes_no_app/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColorSeed: 0).theme(),
        home: ChatScreen(),
      ),
    );
  }
}
