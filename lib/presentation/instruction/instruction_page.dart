import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/common/widgets/custom_app_bar.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: BlurContainer(
                  content: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        "Control the ball with a cleat. +10 points are awarded for each hit of the ball.",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.w400S24WhiteColor,
                      ),
                      const SizedBox(height: 17),
                      Image.asset(
                        Pictures.instruction1,
                        height: 120,
                      ),
                      const SizedBox(height: 55),
                      Text(
                        "Make feints, earn coins. +100 points are awarded for each feint. You can spend points in the store.",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.w400S24WhiteColor,
                      ),
                      Image.asset(
                        Pictures.instruction2,
                        height: 180,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
