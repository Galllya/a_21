import 'dart:async';

import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/game/app_game.dart';
import 'package:a1/presentation/game/bloc/game_bloc.dart';
import 'package:a1/presentation/game/widgets/game_info.dart';
import 'package:a1/presentation/home/home_page.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flame/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late SharedPreferences sharedPreferences;
  int back = 0;
  int boots = 0;
  int ball = 0;
  late Timer timer;
  int time = 3;
  int currentScore = 0;
  int currentHeart = 3;

  late bool haveHeartBoost;
  late bool haveScoreBoost;

  bool youLose = false;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    getBoosts();
    back = sharedPreferences.getInt("back") ?? 0;
    boots = sharedPreferences.getInt("boots") ?? 0;
    ball = sharedPreferences.getInt("ball") ?? 0;

    clock();
    context.read<GameBloc>().add(const GameEvent.started());
    super.initState();
  }

  void getBoosts() {
    String boosts = sharedPreferences.getString("haveBoost") ?? '';
    if (boosts.contains("0")) {
      haveHeartBoost = true;
    } else {
      haveHeartBoost = false;
    }
    if (boosts.contains("1")) {
      haveScoreBoost = true;
    } else {
      haveScoreBoost = false;
    }
  }

  void clock() {
    setState(() {});
    time = 3;
    youLose = false;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (index) {
        setState(() {
          time--;
        });

        if (time == 0) {
          timer.cancel();
        }
      },
    );
  }

  void onLose(int score) {
    setState(() {
      youLose = true;
    });
    int oldMoney = sharedPreferences.getInt("money") ?? 0;
    int newMoney = oldMoney + score;
    sharedPreferences.setInt("money", newMoney);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          load: (score, hearts) {
            if (hearts == 0) {
              onLose(score);
              getBoosts();
              setState(() {});
            }
          },
        );
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/pictures/back_$back.png",
              fit: BoxFit.fitHeight,
            ),
            time == 0
                ? youLose
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOSE",
                            style: AppTextStyle.w700S48WhiteColor,
                          ),
                          const SizedBox(height: 100),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Column(
                              children: [
                                AppButton(
                                  title: "TRY AGAIN",
                                  onTap: () {
                                    clock();
                                    context
                                        .read<GameBloc>()
                                        .add(const GameEvent.started());
                                  },
                                ),
                                const SizedBox(height: 10),
                                AppButton(
                                  title: "MENU",
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : GameWidget(
                        game: AppGame(
                          addPoints: (score) {
                            context
                                .read<GameBloc>()
                                .add(GameEvent.addScore(score));
                          },
                          lose: () {
                            context
                                .read<GameBloc>()
                                .add(const GameEvent.lose());
                          },
                          start: false,
                          back: back,
                          onFinish: () {},
                          balls: ball,
                          boots: boots,
                        ),
                      )
                : Center(
                    child: Text(
                      time.toString(),
                      style: AppTextStyle.w700S64WhiteColor,
                    ),
                  ),
            GameInfo(
              haveHeartBoost: haveHeartBoost,
              haveScoreBoost: haveScoreBoost,
              time: time,
              lose: youLose,
            ),
          ],
        ),
      ),
    );
  }
}
