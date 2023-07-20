import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 50,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor),
                  child: Center(
                    child: Text(
                      "N",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD mental",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Nutrition",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor),
                  child: Center(
                    child: Text(
                      "M H",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD mental",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Nutrition",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor),
                  child: Center(
                    child: Text(
                      "A",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD mental",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Nutrition",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}