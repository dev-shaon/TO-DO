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
        backgroundColor: const Color.fromARGB(255, 9, 56, 210),
        title: Text("Change Username",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(children: [Center(child: Text("data"))]),
    );
  }
}
