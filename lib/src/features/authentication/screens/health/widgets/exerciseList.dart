import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../models/exercise_model.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> availableList;

  ExerciseList({required this.availableList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      height: 300.0,
      child: CarouselSlider.builder(
        itemCount: availableList.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    availableList[index].name,
                  ),
                  Image.asset(
                    availableList[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 100.0,
                  ),
                  Text("Duration: ${availableList[index].duration}"),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: false,
          viewportFraction: 0.6,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
