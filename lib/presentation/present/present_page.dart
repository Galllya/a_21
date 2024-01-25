import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/present/widgets/one_element.dart';
import 'package:a1/presentation/present/widgets/two_element.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresentPage extends StatefulWidget {
  const PresentPage({super.key});

  @override
  State<PresentPage> createState() => _PresentPageState();
}

class _PresentPageState extends State<PresentPage> {
  int currentPresentIndex = 0;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    int lastPresentIndex = sharedPreferences.getInt("presentIndex") ?? 0;
    if (lastPresentIndex == 4) {
      currentPresentIndex = 0;
    } else {
      currentPresentIndex = lastPresentIndex++;
    }
    super.initState();
  }

  void reseive() {
    if (currentPresentIndex == 0 || currentPresentIndex == 3) {
      int lastMoney = sharedPreferences.getInt("money") ?? 0;
      if (currentPresentIndex == 0) {
        lastMoney += 50;
      } else {
        lastMoney += 200;
      }
      sharedPreferences.setInt("money", lastMoney);
    }
    if (currentPresentIndex == 1 || currentPresentIndex == 2) {
      List<String> boostString =
          (sharedPreferences.getString("boost") ?? "").characters.toList();
      List<int> useBoost = [];
      boostString.forEach(
        (element) {
          useBoost.add(int.parse(element));
        },
      );
      if (currentPresentIndex == 1 && !useBoost.contains(0)) {
        useBoost.add(0);
        sharedPreferences.setString("boost", useBoost.toString());
      }
      if (currentPresentIndex == 2 && !useBoost.contains(1)) {
        useBoost.add(1);
        sharedPreferences.setString("boost", useBoost.toString());
      }
    }
    if (currentPresentIndex == 4) {
      List<int> haveBall = [];
      List<String> haveBallString =
          (sharedPreferences.getString("haveBall") ?? "0").characters.toList();
      haveBallString.forEach(
        (element) {
          haveBall.add(int.parse(element));
        },
      );
      if (!haveBall.contains(2)) {
        haveBall.add(2);
        sharedPreferences.setString("haveBall", haveBall.toString());
      }
    }
    sharedPreferences.setString("day", DateTime.now().toString());

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlurContainer(
              content: SizedBox(
                height: 260,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      TwoElement(
                        isActive: currentPresentIndex == 0,
                        image: Pictures.coin,
                        points: 50,
                        day: 1,
                      ),
                      OneElement(
                        isActive: currentPresentIndex == 1,
                        day: 2,
                        image: Pictures.boost0,
                      ),
                      OneElement(
                        isActive: currentPresentIndex == 2,
                        image: Pictures.boost1,
                        day: 3,
                      ),
                      TwoElement(
                        isActive: currentPresentIndex == 4,
                        image: Pictures.coin,
                        points: 200,
                        day: 4,
                      ),
                      OneElement(
                        isActive: currentPresentIndex == 4,
                        image: Pictures.ball2,
                        day: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: AppButton(
              title: "RECEIVE",
              onTap: reseive,
            ),
          ),
        ],
      ),
    );
  }
}
