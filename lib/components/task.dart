import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_app/colors/colors.dart';

class Task extends StatefulWidget {
  final String task;
  final int index;
  final Function(int) deleteTask;

  const Task({
    Key? key,
    required this.task,
    required this.index,
    required this.deleteTask,
  }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);

    // Listen for animation status changes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, delete the task
        widget.deleteTask(widget.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int randomIndex = Random().nextInt(taskColors.length);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: taskColors[randomIndex],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.7,
            child: Text(
              widget.task,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isAnimating = !isAnimating;
                if (isAnimating) {
                  _animationController.forward(from: 0.0);
                } else {
                  _animationController.stop();
                }
              });
            },
            child: LottieBuilder.network(
              "https://lottie.host/45ea4be6-7479-4910-b9d4-fcfdf31307d4/SZ8ihXFO6K.json",
              controller: _animationController,
              width: 90,
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
