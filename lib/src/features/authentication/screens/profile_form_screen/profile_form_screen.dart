// import 'package:auth/src/features/authentication/screens/profile_form_screen/profile_view_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../constants/sizes.dart';
// import '../dashbaord/dashboard.dart';
//
// class ProfileFormScreen extends StatefulWidget {
//   @override
//   _ProfileFormScreenState createState() => _ProfileFormScreenState();
// }
//
// class _ProfileFormScreenState extends State<ProfileFormScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? _gender;
//   double? _weight;
//   double? _height;
//   String? _activityFactor;
//   String? _goalWeight;
//   String? _planToReach;
//
//   // Firebase Firestore instance
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   // Function to save profile details to Firestore
//   Future<void> _saveProfileDetails() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       // Save profile details to Firestore
//       try {
//         DocumentReference documentRef = await _firestore.collection('profile').add({
//           'gender': _gender,
//           'weight': _weight,
//           'height': _height,
//           'activityFactor': _activityFactor,
//           'goalWeight': _goalWeight,
//           'planToReach': _planToReach,
//         });
//
//         // Get the document ID of the newly added document
//         String documentId = documentRef.id;
//
//         // Show a success snack bar
//         Get.snackbar(
//           "Success",
//           "Your profile has been created",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green.withOpacity(0.1),
//           colorText: Colors.green,
//         );
//
//         // Navigate to the dashboard or any other desired screen
//         Get.to(() => Dashboard());
//
//       } catch (e) {
//         // Handle any errors that occurred during saving to Firestore
//         print('Error saving profile details: $e');
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               DropdownButtonFormField<String>(
//                 value: _gender,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _gender = newValue;
//                   });
//                 },
//                 items: ['Male', 'Female'].map((gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a gender';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: tFormHeight - 20,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Weight (kg)'),
//                 onSaved: (newValue) {
//                   _weight = double.tryParse(newValue ?? '');
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your weight';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: tFormHeight - 20,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Height (cm)'),
//                 onSaved: (newValue) {
//                   _height = double.tryParse(newValue ?? '');
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your height';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: tFormHeight - 20,
//               ),
//               DropdownButtonFormField<String>(
//                 value: _activityFactor,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _activityFactor = newValue;
//                   });
//                 },
//                 items: ['A', 'B', 'C', 'D'].map((factor) {
//                   return DropdownMenuItem<String>(
//                     value: factor,
//                     child: Text(factor),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Activity Factor'),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select an activity factor';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: tFormHeight - 20,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Goal Weight (kg)'),
//                 onSaved: (newValue) {
//                   _goalWeight = newValue;
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your goal weight';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: tFormHeight - 20,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Plan to Reach Goal'),
//                 onSaved: (newValue) {
//                   _planToReach = newValue;
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your plan to reach your goal weight';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _saveProfileDetails,
//                 child: Text('Save',),
//
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:auth/src/features/authentication/screens/main_page/main_page.dart';
import 'package:auth/src/features/authentication/screens/profile_form_screen/profile_view_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../dashbaord/dashboard.dart';

class ProfileFormScreen extends StatefulWidget {
  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _gender;
  double? _weight;
  double? _height;
  String? _activityFactor;
  String? _goalWeight;
  String? _planToReach;

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // Function to save profile details to Firestore
  Future<void> _saveProfileDetails() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save profile details to Firestore
      try {
        DocumentReference documentRef =
        await _firestore.collection('profile').add({
          'gender': _gender,
          'weight': _weight,
          'height': _height,
          'activityFactor': _activityFactor,
          'goalWeight': _goalWeight,
          'planToReach': _planToReach,
        });

        // Get the document ID of the newly added document
        String documentId = documentRef.id;

        // Show a success snack bar
        Get.snackbar(
          "Success",
          "Your profile has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );

        // Navigate to the dashboard or any other desired screen
        Get.to(() => MainPage());

      } catch (e) {
        // Handle any errors that occurred during saving to Firestore
        print('Error saving profile details: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Form'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              DropdownButtonFormField<String>(
                value: _gender,
                onChanged: (newValue) {
                  setState(() {
                    _gender = newValue;
                  });
                },
                items: ['Male', 'Female'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: tFormHeight - 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                onSaved: (newValue) {
                  _weight = double.tryParse(newValue ?? '');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: tFormHeight - 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Height (cm)'),
                onSaved: (newValue) {
                  _height = double.tryParse(newValue ?? '');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),
              SizedBox(height: tFormHeight - 20),
              DropdownButtonFormField<String>(
                value: _activityFactor,
                onChanged: (newValue) {
                  setState(() {
                    _activityFactor = newValue;
                  });
                },
                items: ['Physical Activities', 'Mental Stimulation', 'Emotional Well-being', 'Relaxation and Joy'].map((factor) {
                  return DropdownMenuItem<String>(
                    value: factor,
                    child: Text(factor),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Activity Factor'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select an activity factor';
                  }
                  return null;
                },
              ),
              SizedBox(height: tFormHeight - 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Goal Weight (kg)'),
                onSaved: (newValue) {
                  _goalWeight = newValue;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your goal weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: tFormHeight - 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Plan to Reach Goal'),
                onSaved: (newValue) {
                  _planToReach = newValue;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your plan to reach your goal weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveProfileDetails,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
