// ViewFormScreen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewFormScreen extends StatefulWidget {
  final String userId;

  const ViewFormScreen({required this.userId, required String documentId});

  @override
  _ViewFormScreenState createState() => _ViewFormScreenState();
}

class _ViewFormScreenState extends State<ViewFormScreen> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Get.arguments['docId'].toString()).get();
      setState(() {
        _userData = snapshot.data() as Map<String, dynamic>;
      });
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Profile'),
      ),
      body: _userData != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Document ID: ${widget.userId}'),
          Text('Gender: ${_userData!['gender']}'),
          Text('Weight: ${_userData!['weight']}'),
          Text('Height: ${_userData!['height']}'),
          Text('Activity Factor: ${_userData!['activityFactor']}'),
          Text('Goal Weight: ${_userData!['goalWeight']}'),
          Text('Plan to Reach: ${_userData!['planToReach']}'),
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
