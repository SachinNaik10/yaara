import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'create_note/notes.dart';

class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  TextEditingController noteController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(colors: [
          Color(0xFF8EC5FC),
          Color(0xFFE0C3FC),
        ]),
        appBar: AppBar(
          title: Text("Note Down Your Daily Tasks"),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  controller: noteController,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "Add Here!"),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection("notes").add({
                    "note": noteController.text,
                    "createdAt": DateTime.now(),
                  }).then((value) {
                    print("note added");
                    Fluttertoast.showToast(
                      msg: "Note added successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );
                    Get.offAll(NotesScreen());
                    noteController.clear();
                  });
                },
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
