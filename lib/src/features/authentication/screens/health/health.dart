import 'package:auth/src/features/authentication/screens/health/widgets/exerciseList.dart';
import 'package:auth/src/features/authentication/screens/health/widgets/session.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../models/exercise_model.dart';

class HealthPage extends StatefulWidget {
  final String plan;

  HealthPage({required this.plan});

  @override
  _HealthPageState createState() => _HealthPageState();
}

final repsController = TextEditingController();
String dayname = DateFormat.EEEE().format(DateTime.now());

final List<Exercise> availableList = [
  Exercise(
      name: "Pushups",
      imageUrl: "assets/images/pushup.gif",
      songUrl: "assets/audio/Song 14 - Rock.mp3",
      duration: 30),
  Exercise(
      name: "Crunches",
      imageUrl: "assets/images/crunches.gif",
      songUrl: "assets/audio/Song 18 - Rock.mp3",
      duration: 30),
  Exercise(
      name: "Squats",
      imageUrl: "assets/images/squats.gif",
      songUrl: "assets/audio/Song 34 - Pop.mp3",
      duration: 30),
  Exercise(
      name: "Burpees",
      imageUrl: "assets/images/burpees.gif",
      songUrl: "assets/audio/joined audio.mp3",
      duration: 30),
  Exercise(
      name: "Bicycle crunches",
      imageUrl: "assets/images/bicycle.gif",
      songUrl: "assets/audio/50 - Up from the ashes.mp3",
      duration: 30),
  Exercise(
      name: "lunges",
      imageUrl: "assets/images/lunges.gif",
      songUrl: "assets/audio/Song 14 - Rock.mp3",
      duration: 30),
  Exercise(
      name: "plank",
      imageUrl: "assets/images/plank.gif",
      songUrl: "assets/audio/Song 18 - Rock.mp3",
      duration: 30),
  Exercise(
      name: "tricep dips",
      imageUrl: "assets/images/tricep.gif",
      songUrl: "assets/audio/Song 34 - Pop.mp3",
      duration: 30),
  Exercise(
      name: "mountain climbers",
      imageUrl: "assets/images/climbers.gif",
      songUrl: "assets/audio/joined audio.mp3",
      duration: 30),
  Exercise(
      name: "squat jumps",
      imageUrl: "assets/images/jumps.gif",
      songUrl: "assets/audio/50 - Up from the ashes.mp3",
      duration: 30),
];

class _HealthPageState extends State<HealthPage> {
  List<Exercise> randomList = [];
  bool checkedButton = false;
  int reps = 1;

  void generateRandomList() {
    randomList = [];
    var arr = [];
    Random rand = new Random();
    int min = 0, max = 9;
    while (arr.length < 5) {
      int r = min + rand.nextInt(max - min);
      if (!arr.contains(r)) {
        arr.add(r);
        setState(() {
          randomList.add(availableList[r]);
          checkedButton = true;
        });
      }
    }
  }

  void generateDaywiseList() {
    List<Exercise> monday = [
      availableList[0],
      availableList[1],
      availableList[2],
      availableList[3],
      availableList[4]
    ];
    List<Exercise> tuesday = [
      availableList[1],
      availableList[2],
      availableList[3],
      availableList[4],
      availableList[5]
    ];
    List<Exercise> wednesday = [
      availableList[2],
      availableList[3],
      availableList[4],
      availableList[5],
      availableList[6]
    ];
    List<Exercise> thursday = [
      availableList[3],
      availableList[4],
      availableList[5],
      availableList[6],
      availableList[7]
    ];
    List<Exercise> friday = [
      availableList[4],
      availableList[5],
      availableList[6],
      availableList[7],
      availableList[8]
    ];
    List<Exercise> saturday = [
      availableList[5],
      availableList[6],
      availableList[7],
      availableList[8],
      availableList[9]
    ];
    List<Exercise> sunday = [
      availableList[9],
      availableList[8],
      availableList[6],
      availableList[4],
      availableList[2]
    ];

    setState(() {
      switch (dayname) {
        case "Monday":
          randomList = monday;
          break;
        case "Tuesday":
          randomList = tuesday;
          break;
        case "Wednesday":
          randomList = wednesday;
          break;
        case "Thursday":
          randomList = thursday;
          break;
        case "Friday":
          randomList = friday;
          break;
        case "Saturday":
          randomList = saturday;
          break;
        case "Sunday":
          randomList = sunday;
          break;
        default:
          randomList = availableList;
      }
      checkedButton = false;
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomList();
  }

  void _startExercise(context) {
    print(reps);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Session(
        reps: reps,
        exerciseList: randomList,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: [
        Color(0xFF8EC5FC),
        Color(0xFFE0C3FC),
      ]),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                      child: Text(
                        "Workout Plan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 30.0,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        "It's $dayname today.\nChoose your plan.",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => generateRandomList(),
                              child: Text(
                                " RANDOMIZE ",
                                style: TextStyle(
                                    color: checkedButton
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => generateDaywiseList(),
                              child: Text(
                                "    DAY-WISE    ",
                                style: TextStyle(
                                    color: checkedButton
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ],
                        ),
                        ExerciseList(
                          availableList:
                          randomList.isEmpty ? availableList : randomList,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Select number of reps:",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Container(
                                  height: 100.0,
                                  width: 100,
                                  child: CupertinoPicker(
                                      backgroundColor: Colors.white,
                                      itemExtent: 32.0,
                                      onSelectedItemChanged: (selectedItem) {
                                        reps = selectedItem;
                                        print(selectedItem.runtimeType);
                                      },
                                      children: [
                                        Text("1"),
                                        Text("2"),
                                        Text("3"),
                                        Text("4"),
                                        Text("5"),
                                      ]),
                                )
                              ],
                            ),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              child: GestureDetector(
                                onTap: () => _startExercise(context),
                                child: Image.asset("assets/images/play.png"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
