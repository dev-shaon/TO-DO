import 'package:flutter/material.dart';
import 'package:to_do/Screens/db_helper.dart';
import 'package:to_do/Screens/model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final titleController = TextEditingController();
  final notesController = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Add task",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 6),

                // Title Input
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Enter your task title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  "Category",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 6),

                // Category UI
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 135, 197, 248),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Work",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down, size: 36),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  "Date & Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: _pickDate,
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        Text(
                          selectedDate == null
                              ? "Select Date"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 4, 135, 243),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: _pickTime,
                          icon: const Icon(
                            Icons.more_time,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          selectedTime == null
                              ? "Select Time"
                              : selectedTime!.format(context),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 8, 136, 240),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),

                // Notes Input
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(
                    hintText: "Enter your notes here.",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 80,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // SAVE BUTTON
                Center(
                  child: IconButton(
                    onPressed: () async {
                      // 🚨 Null Safety এবং খালি Title চেক করা হচ্ছে
                      if (titleController.text.trim().isEmpty) {
                        _showSnackBar("Please enter a task title.");
                        return;
                      }
                      
                      if (selectedDate == null || selectedTime == null) {
                        _showSnackBar("Please select both Date and Time.");
                        return;
                      }
                      
                      final task = TaskModel(
                        title: titleController.text.trim(),
                        notes: notesController.text.trim(),
                        date: selectedDate!, 
                        time: "${selectedTime!.hour}:${selectedTime!.minute}", 
                        category: '',
                      );

                      await DBHelper.instance.insertTask(task);

                      // Go back and signal that a task was added
                      Navigator.pop(context, true);
                    },

                    icon: const Icon(
                      Icons.check_circle,
                      size: 70,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}