import 'package:flutter/material.dart';
import 'package:to_do/Screens/home_screen.dart';

class BotomHome extends StatefulWidget {
  const BotomHome({super.key});

  @override
  State<BotomHome> createState() => _BotomHomeState();
}

class _BotomHomeState extends State<BotomHome> {
  int bottomNavIndex = 0;


  final List<Widget> screens = [
   HomeScreen(title: '',),
    Center(
      child: Text(
        "Calendar Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
     
    ),
    Center(
      child: Text(
        "Settings Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5F9),

      // 🔹 Body changes based on bottomNavIndex
      body: SafeArea(child: screens[bottomNavIndex]),

      floatingActionButton: Transform.translate(
        offset: const Offset(0, 10),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            print("Floating Button Pressed");
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
            color: Colors.black,
            child: SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIcon(Icons.home, 0),
                  _buildNavIcon(Icons.calendar_month, 1),
                  const SizedBox(width: 50), // FAB gap
                  _buildNavIcon(Icons.chat_bubble, 2),
                  _buildNavIcon(Icons.settings, 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Icon builder
  Widget _buildNavIcon(IconData icon, int index) {
    final isSelected = bottomNavIndex == index;
    return IconButton(
      onPressed: () {
        setState(() {
          bottomNavIndex = index; // update screen
        });
      },
      icon: Icon(
        icon,
        size: 30,
        color: isSelected ? Colors.blueAccent : Colors.grey,
      ),
    );
  }
}
