import 'package:flutter/material.dart';
import 'package:to_do/Screens/db_helper.dart';
import 'package:to_do/Screens/model.dart';

class AllTask extends StatefulWidget {
  static List<Map<String, dynamic>> tasks = [];

  const AllTask({super.key});

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    tasks = await DBHelper.instance.getTasks();
    setState(() {});
  }

  Future<void> deleteTask(int id) async {
    await DBHelper.instance.deleteTask(id);
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("All Task",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),

      body: tasks.isEmpty
          ? const Center(child: Text("All Tasks will appear here"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(task.title,
                        style:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "Date: ${task.date.day}/${task.date.month}/${task.date.year}\n"
                      "Time: ${task.time}\n"
                      "Notes: ${task.notes}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTask(task.id!),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

