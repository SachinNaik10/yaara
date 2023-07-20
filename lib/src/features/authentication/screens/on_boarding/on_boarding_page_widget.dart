import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: const EdgeInsets.all(tDefaultSize),
        // color: model.bgColor,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,     // by defaults it sets so no need to change
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Image(image: AssetImage(model.image), height: model.height * 0.8,),
            // Column(
            //   children: [
            //     Text(model.title, style: Theme.of(context).textTheme.headlineLarge,),
            //     Text(model.subTitle, textAlign: TextAlign.center,),
            //   ],
            // ),
            // Text(model.CounterText, style: Theme.of(context).textTheme.headlineMedium,),
            // SizedBox(height: 50.0,)
          ],
        ),
      ),
    );
  }
}