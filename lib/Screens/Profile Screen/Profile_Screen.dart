import 'package:flutter/material.dart';
import 'package:to_do/Screens/sign_in.dart';
import 'package:to_do/Wigets/Profile_wigets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Your Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                        backgroundColor: Colors.blue,
                      ),

                      // Positioned Edit Button
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.filter,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "SHAON DAS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const Text(
                "shaondas22@gmail.com",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 30),

              ProfileItem(title: "Change Username"),
              ProfileItem(title: "Change Password"),
              ProfileItem(title: "Notification"),

              const SizedBox(height: 30),

              SizedBox(
                width: 170,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                  label: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  icon: const Icon(Icons.logout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
