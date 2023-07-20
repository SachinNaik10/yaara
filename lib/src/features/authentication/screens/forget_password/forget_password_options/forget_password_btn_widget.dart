import 'package:flutter/material.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key, required this.btnIcon, required this.title, required this.subTitle, required this.onTap,
  });

  final IconData btnIcon;
  final   VoidCallback onTap;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 50.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall),

              ],
            )
          ],
        ),
      ),
    );
  }
}