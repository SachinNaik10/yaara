import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
  required this.image, required this.title, required this.subTitle,
    this.imageColor, this.imageHeight = 0.2, this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start, this.textAlign,
  });


  final String image, title, subTitle;
  final Color? imageColor;
  final double? imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image:  AssetImage(image),
          height: size.height * 0.2,
        ),
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
        Text(
          subTitle,
          textAlign: textAlign,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge,
        ),
      ],
    );
  }
}