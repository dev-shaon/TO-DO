import 'package:flutter/material.dart';

class ChangeeUsername extends StatefulWidget {
  const ChangeeUsername({super.key});

  @override
  State<ChangeeUsername> createState() => _ChangeeUsernameState();
}

class _ChangeeUsernameState extends State<ChangeeUsername> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [
          Center(child: Text("data"),)
        ],
      ),
    );
  }
}