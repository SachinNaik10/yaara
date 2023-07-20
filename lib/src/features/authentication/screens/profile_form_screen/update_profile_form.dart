// EditFormScreen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditFormScreen extends StatefulWidget {
  final String documentId;
  final String gender;
  final double weight;
  final double height;
  final String activityFactor;
  final String goalWeight;
  final String planToReach;

  const EditFormScreen({
    required this.documentId,
    required this.gender,
    required this.weight,
    required this.height,
    required this.activityFactor,
    required this.goalWeight,
    required this.planToReach,
  });

  @override
  _EditFormScreenState createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  String? _gender;
  double? _weight;
  double? _height;
  String? _activityFactor;
  String? _goalWeight;
  String? _planToReach;

  @override
  void initState() {
    super.initState();
    _gender = widget.gender;
    _weight = widget.weight;
    _height = widget.height;
    _activityFactor = widget.activityFactor;
    _goalWeight = widget.goalWeight;
    _planToReach = widget.planToReach;
  }

  Future<void> _updateRecord() async {
    // Update the Firestore document with the new values
    await FirebaseFirestore.instance.collection('users').doc(widget.documentId).update({
      'gender': _gender,
      'weight': _weight,
      'height': _height,
      'activityFactor': _activityFactor,
      'goalWeight': _goalWeight,
      'planToReach': _planToReach,
    });

    // Navigate back to the ViewFormScreen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: _gender,
              onChanged: (value) => setState(() => _gender = value),
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextFormField(
              initialValue: _weight.toString(),
              onChanged: (value) => setState(() => _weight = double.tryParse(value)),
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              initialValue: _height.toString(),
              onChanged: (value) => setState(() => _height = double.tryParse(value)),
              decoration: InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              initialValue: _activityFactor,
              onChanged: (value) => setState(() => _activityFactor = value),
              decoration: InputDecoration(labelText: 'Activity Factor'),
            ),
            TextFormField(
              initialValue: _goalWeight,
              onChanged: (value) => setState(() => _goalWeight = value),
              decoration: InputDecoration(labelText: 'Goal Weight'),
            ),
            TextFormField(
              initialValue: _planToReach,
              onChanged: (value) => setState(() => _planToReach = value),
              decoration: InputDecoration(labelText: 'Plan to Reach'),
            ),
            ElevatedButton(
              onPressed: _updateRecord,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
