import 'package:flutter/material.dart';
import 'package:to_do/Screens/db_helper.dart';
import 'package:to_do/Screens/model.dart';

class AllTask extends StatefulWidget {
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

  void editTask(TaskModel task) {
    final titleController = TextEditingController(text: task.title);
    final notesController = TextEditingController(text: task.notes);
    DateTime selectedDate = task.date;
    TimeOfDay selectedTime = TimeOfDay(
      hour: int.parse(task.time.split(":")[0]),
      minute: int.parse(task.time.split(":")[1]),
    );

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Edit Task"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                    TextFormField(
                      controller: notesController,
                      decoration: const InputDecoration(labelText: "Notes"),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Time: ${selectedTime.format(context)}"),
                        IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                            );
                            if (picked != null) {
                              setState(() {
                                selectedTime = picked;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () async {
                    task.title = titleController.text;
                    task.notes = notesController.text;
                    task.date = selectedDate;
                    task.time =
                        "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}";
                    await DBHelper.instance.updateTask(task);
                    loadTasks();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "All Tasks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                    title: Text(
                      task.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "Date: ${task.date.day}/${task.date.month}/${task.date.year}\nTime: ${task.time}\nNotes: ${task.notes}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () => editTask(task),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteTask(task.id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
