import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String password;
  // final String gender;
  // final double weight;
  // final double height;
  // final String activityFactor;
  // final String goalWeight;
  // final String planToReach;
  const UserModel( {this.id,required this.fullName,required this.email,required this.password,

});


  toJson(){
    return{
      "FullName": fullName,
      "Email": email,
      "Password": password,
      // "gender":gender,
      // "weight":weight,
      // "height":height,
      // "activityFactor":activityFactor,
      // "goalWeight":goalWeight,
      // "planToReach":planToReach
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],

    );
  }
}

