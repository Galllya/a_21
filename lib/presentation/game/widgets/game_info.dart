import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/game/bloc/game_bloc.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameInfo extends StatefulWidget {
  final int time;
  final bool haveHeartBoost;
  final bool haveScoreBoost;
  final bool lose;
  const GameInfo({
    super.key,
    required this.time,
    required this.haveHeartBoost,
    required this.haveScoreBoost,
    required this.lose,
  });

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  late SharedPreferences sharedPreferences;
  late bool haveHeartBoostIdl;
  late bool haveScoreBoosttIdl;

  @override
  void initState() {
    haveHeartBoostIdl = widget.haveHeartBoost;
    haveScoreBoosttIdl = widget.haveScoreBoost;
    sharedPreferences = context.read<SharedPreferences>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          load: (score, hearts) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23, top: 48),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SizedBox(
                          width: 64,
                          height: 64,
                          child: BlurContainer(
                            content: SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.asset(
                                Pictures.menu,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.time == 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            for (int i = 0; i < 3; i++)
                              SvgPicture.asset(
                                hearts > i ? Svgs.heartFill : Svgs.heartEmpty,
                                height: 40,
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              if (widget.time == 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        (haveHeartBoostIdl && hearts < 3)
                            ? GestureDetector(
                                onTap: () {
                                  haveHeartBoostIdl = false;
                                  context.read<GameBloc>().add(
                                        const GameEvent.addHeart(),
                                      );
                                  if (haveScoreBoosttIdl) {
                                    sharedPreferences.setString(
                                        "haveBoost", "1");
                                  } else {
                                    sharedPreferences.setString(
                                        "haveBoost", "");
                                  }
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: BlurContainer(
                                      content: Center(
                                        child: Image.asset(
                                          Pictures.boost0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                width: 80,
                              ),
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: BlurContainer(
                              content: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Svgs.score,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      score.toString(),
                                      style: AppTextStyle.w700S32WhiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        (haveScoreBoosttIdl && widget.lose)
                            ? GestureDetector(
                                onTap: () {
                                  haveScoreBoosttIdl = false;

                                  context.read<GameBloc>().add(
                                        GameEvent.addScore(score),
                                      );

                                  if (haveHeartBoostIdl) {
                                    sharedPreferences.setString(
                                        "haveBoost", "0");
                                  } else {
                                    sharedPreferences.setString(
                                        "haveBoost", "");
                                  }
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: BlurContainer(
                                      content: Center(
                                        child: Image.asset(
                                          Pictures.boost1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                width: 80,
                              ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
