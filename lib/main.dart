import 'package:bloc_state/home/ui/home_page.dart';
import 'package:bloc_state/provider.dart';
import 'package:bloc_state/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     ChangeNotifierProvider(
      create: (context) => Counter(),  // Provide the Counter model
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bloc state",
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
