import 'dart:math';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  late SharedPreferences sharedPreferences;
  late TextEditingController controller;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    String? name = sharedPreferences.getString("name");
    if (name == null) {
      controller = TextEditingController();
    } else {
      controller = TextEditingController(
        text: name,
      );
    }

    super.initState();
  }

  void onNextTap() {
    String userName;
    if (controller.text.isNotEmpty) {
      userName = controller.text;
    } else {
      int userId = Random().nextInt(999999) + 100000;
      userName = "PLAYER#$userId";
    }
    sharedPreferences.setString("name", userName);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "USER NAME:",
              style: AppTextStyle.w700S32WhiteColor,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              children: [
                const BlurContainer(
                  content: SizedBox(
                    height: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 6,
                  ),
                  child: TextField(
                    controller: controller,
                    style: AppTextStyle.w400S40WhiteColor,
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: AppTextStyle.w400S40WhiteColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 85),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: AppButton(
              title: "NEXT",
              onTap: onNextTap,
            ),
          ),
        ],
      ),
    );
  }
}
