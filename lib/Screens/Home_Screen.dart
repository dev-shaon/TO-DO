import 'package:flutter/material.dart';
import 'package:to_do/Screens/Task%20Screen/All_task.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"icon": Icons.work, "label": "Work", "color": Colors.red},
      {"icon": Icons.person, "label": "Personal", "color": Colors.green},
      {"icon": Icons.school, "label": "Study", "color": Colors.orange},
      {"icon": Icons.fitness_center,"label": "Fitness","color": Colors.purple,},
      {"icon": Icons.shopping_cart, "label": "Shopping", "color": Colors.teal},
      {"icon": Icons.travel_explore, "label": "Travel", "color": Colors.blue},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 14),

          ////// Categories GridView
          SizedBox(
            height: 200,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 100 / 88,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: categories[index]["color"],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        categories[index]["icon"],
                        color: categories[index]["color"],
                        size: 30,
                      ),
                      Text(
                        categories[index]["label"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today’s task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllTask()));
                },
                child: const Text(
                  "See all",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          //today Task list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF90B8FD),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "task ${index + 1}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
