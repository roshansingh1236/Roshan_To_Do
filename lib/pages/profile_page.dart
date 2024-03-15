import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/colors/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  String name = "Roshan Pratap Singh";
  String school = "BBDU";
  int age = 30;
  ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
             leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
               color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: mainColor,
        body: Column(
          children: [
            const SizedBox(height: 20),
            //app bar
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/me.jpeg"),
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : $name",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200,
                  child: const Divider(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Age : $age",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "School : $school",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
