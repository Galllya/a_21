import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/presentation/game/game_page.dart';
import 'package:a1/presentation/instruction/instruction_page.dart';
import 'package:a1/presentation/present/present_page.dart';
import 'package:a1/presentation/rating/rating_page.dart';
import 'package:a1/presentation/setting/setting_page.dart';
import 'package:a1/presentation/shop/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      present();
    });
    super.initState();
  }

  void openPage(Widget page) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  void present() {
    String? lastDayString = sharedPreferences.getString("day");

    if (lastDayString != null) {
      DateTime? lastDay = DateTime.parse(lastDayString);
      if (DateTime.now().difference(lastDay).inDays >= 1) {
        getPresent();
      }
    } else {
      getPresent();
    }
  }

  void getPresent() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PresentPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: AppButton(
                title: "START",
                onTap: () => openPage(
                  const GamePage(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: "SHOP",
              onTap: () => openPage(
                const ShopPage(),
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: "SETTING",
              onTap: () => openPage(
                const SettingPage(),
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: "RATING",
              onTap: () => openPage(
                const RatingPage(),
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: "HOW TO PLAY",
              onTap: () => openPage(
                const InstructionPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
