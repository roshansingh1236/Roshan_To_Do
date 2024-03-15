import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/colors/colors.dart';
import 'package:task_app/components/add_button.dart';
import 'package:task_app/components/custom_input_field.dart';
import 'package:task_app/pages/home_page.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();

  Future<void> handleAddTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasks = prefs.getStringList('tasks');
    tasks ??= [];
    tasks.add(_controller.text.trim());
    await prefs.setStringList('tasks', tasks);
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Add a task",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add your task",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          CustomInputField(
            controller: _controller,
          ),
          const SizedBox(height: 30),
          AddButton(
            handleAddTask: handleAddTask,
          )
        ],
      ),
    );
  }
}
