import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class TwoElement extends StatelessWidget {
  final int points;
  final String image;
  final int day;
  final bool isActive;
  const TwoElement({
    super.key,
    required this.image,
    required this.points,
    required this.day,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Column(
          children: [
            isActive
                ? Image.asset(
                    Pictures.poly,
                    height: 40,
                  )
                : const SizedBox(
                    height: 40,
                  ),
            Expanded(
              child: BlurContainer(
                content: DecoratedBox(
                  decoration: isActive
                      ? const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff2DE4B7),
                              Color(0xff018565),
                            ],
                          ),
                        )
                      : const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+$points",
                          style: AppTextStyle.w700S20WhiteColor,
                        ),
                        const SizedBox(height: 4),
                        Image.asset(
                          image,
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "DAY $day",
              style: AppTextStyle.w700S16WhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
