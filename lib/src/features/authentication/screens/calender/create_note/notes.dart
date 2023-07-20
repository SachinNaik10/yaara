import 'package:auth/src/features/authentication/screens/calender/edit_note/edit_note_screen.dart';
import 'package:auth/src/features/authentication/screens/calender/planner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("notes")
              // .where("userId",isEqualTo: userId?.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No Data Found"));
            }
            // ignore: unnecessary_null_comparison
            if (snapshot != null && snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var note = snapshot.data!.docs[index]['note'];
                    var docId = snapshot.data!.docs[index].id;
                    //add createdAt if needed
                    return Card(
                      child: ListTile(
                        title: Text(note),
                        // subtitle: for created at ,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.to(() => EditNoteScreen(), arguments: {
                                    'note': note,
                                    'docId': docId,
                                  });
                                },
                                child: Icon(Icons.edit)),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await FirebaseFirestore.instance.collection("notes").doc(docId).delete();
                                Fluttertoast.showToast(
                                  msg: 'Note deleted successfully',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red, // Set the background color to red for deletion
                                  textColor: Colors.white,
                                );
                              },
                              child: Icon(Icons.delete),
                            )


                          ],
                        ),
                      ),
                    );
                  });
            }

            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Planner());
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
