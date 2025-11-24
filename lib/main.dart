import 'package:flutter/material.dart';
import 'package:to_do/Screens/fristScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Fristscreen(),
    );
  }
}
