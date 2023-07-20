import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import 'fade_in_animation_controller.dart';
import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key ? key,
    required this.durationInMs, this.animatePosition, required this.child,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition ? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          AnimatedPositioned(
            duration: Duration(milliseconds: durationInMs),
         
            top: controller.animate.value ? animatePosition!.topAfter : animatePosition!.topBefore,
            left: controller.animate.value ? animatePosition!.leftAfter : animatePosition!.leftBefore,
            bottom: controller.animate.value ? animatePosition!.bottomAfter : animatePosition!.bottomBefore,
            right: controller.animate.value ? animatePosition!.rightAfter : animatePosition!.rightBefore,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: durationInMs),
              opacity: controller.animate.value ? 1 : 0,
              child: child,
              // child: Image(image: AssetImage())
              
            ),
          ),
    );
  }
}
