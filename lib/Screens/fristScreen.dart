import 'package:flutter/material.dart';
import 'package:to_do/Screens/sign_in.dart';

class Fristscreen extends StatefulWidget {
  const Fristscreen({super.key});

  @override
  State<Fristscreen> createState() => _FristscreenState();
}

class _FristscreenState extends State<Fristscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 110),
              Center(child: Image(image: AssetImage("assets/images/todo.png"))),
              SizedBox(height: 50),
              Text.rich(
                TextSpan(
                  text: "Simplify, Organize, and \nConquer ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  children: [
                    TextSpan(
                      text: "Your Day",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                "Take control of your tasks and \nachieve your goals.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: Size(250, 50),
                  backgroundColor: Colors.blue
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                }, 
              child: Text("Lets Start"))
            ],
          ),
        ),
      ),
    );
  }
}
