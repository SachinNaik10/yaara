import 'dart:ffi';

import 'package:auth/src/features/authentication/screens/calender/create_note/notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(

      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: noteController
                ..text = "${Get.arguments['note'].toString()}",
              maxLines: null,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("notes")
                      .doc(Get.arguments['docId'].toString())
                      .update(
                    {
                      'note': noteController.text,
                    },
                  ).then((value) => {
                            Get.offAll(() => NotesScreen()),
                            Fluttertoast.showToast(
                                msg: 'Data Updated',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.green,
                                textColor: Colors.black,
                                fontSize: 16.0)
                          });
                },
                child: Text("Update!"))
          ],
        ),
      ),
    );
  }
}
