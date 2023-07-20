import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class TopCourses extends StatelessWidget {
  const TopCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCardBgColor),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("1txt2img")],
                      //IMAGES 1 TEXT 2 IMAGE AT 23 MINS
                      //use flexible for allign images in proper format
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder()),
                        ),
                        SizedBox(
                          height: tDashboardPadding,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text("ADD OTHER SECOTIONS HERE")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCardBgColor),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("1txt2img")],
                      //IMAGES 1 TEXT 2 IMAGE AT 23 MINS
                      //use flexible for allign images in proper format
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder()),
                        ),
                        SizedBox(
                          height: tDashboardPadding,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text("ADD OTHER SECOTIONS HERE")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCardBgColor),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("1txt2img")],
                      //IMAGES 1 TEXT 2 IMAGE AT 23 MINS
                      //use flexible for allign images in proper format
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder()),
                        ),
                        SizedBox(
                          height: tDashboardPadding,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text("ADD OTHER SECOTIONS HERE")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}