import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/controllers/game_controller.dart';
import 'package:flutter_memory_game_app/theme.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider<GameController>(create: (_) => GameController()),
    ],
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stranger Things Memory',
      debugShowCheckedModeBanner: false,
      theme: StrangerThingsTheme.theme,
      home: const HomePage(),
    );
  }
}