import 'package:flutter/material.dart';

class AllTask extends StatefulWidget {
  const AllTask({super.key});

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 53, 244),
        title: const Text(
          "All Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search,size: 26,),
            ),
          ),
        ],
      ),

      body:  Center(
        child: Text(
          "All Tasks will appear here",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
