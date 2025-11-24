import 'package:flutter/material.dart';
import 'package:to_do/Screens/Add_task.dart';
import 'package:to_do/Screens/All_task.dart';
import 'package:to_do/Screens/Profile_Screen.dart';
import 'package:to_do/Screens/home_screen.dart';

class BotomHome extends StatefulWidget {
  const BotomHome({super.key});

  @override
  State<BotomHome> createState() => _BotomHomeState();
}

class _BotomHomeState extends State<BotomHome> {
  int bottomNavIndex = 0;


  final List<Widget> screens = [
   HomeScreen(title: "",),
    
    const Center(child: Text("Assignments Screen")),
    AllTask(),
    ProfileScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,

      body: SafeArea(child: screens[bottomNavIndex]),

      floatingActionButton: Transform.translate(
        
        offset: const Offset(0, 10),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 22, 94, 218),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask()));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 8,
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            elevation: 10,
            color: Colors.white70,
            child: SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIcon(Icons.home, 0),
                  _buildNavIcon(Icons.calendar_month, 1),
                  const SizedBox(width: 50), 
                  _buildNavIcon(Icons.assignment, 2),
                  _buildNavIcon(Icons.person, 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    final isSelected = bottomNavIndex == index;
    return IconButton(
      onPressed: () {
        setState(() {
          bottomNavIndex = index;
        });
      },
      icon: Icon(
        icon,
        size: 30,
        color: isSelected ? const Color.fromARGB(255, 22, 90, 206) : const Color.fromARGB(255, 105, 104, 104),
      ),
    );
  }
}