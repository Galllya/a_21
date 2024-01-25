import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/common/widgets/custom_app_bar.dart';
import 'package:a1/data/leaders_data.dart';
import 'package:a1/domain/leader_model.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  bool loading = true;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<LeaderModel> leaders = LeadersData.getLeaders();
    return AppScreen(
      content: loading
          ? const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 10,
                ),
              ),
            )
          : Column(
              children: [
                const CustomAppBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Pictures.medal),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "LEADERBOARD",
                        style: AppTextStyle.w700S28WhiteColor,
                      ),
                    ),
                    Image.asset(Pictures.medal),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 8,
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: BlurContainer(
                          content: Padding(
                            padding: const EdgeInsets.all(4),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                BlurContainer(
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "RANK",
                                          style: AppTextStyle.w400S20WhiteColor,
                                        ),
                                        Text(
                                          "NAME",
                                          style: AppTextStyle.w400S20WhiteColor,
                                        ),
                                        Text(
                                          "SCORES",
                                          style: AppTextStyle.w400S20WhiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                for (int i = 0; i < 10; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Stack(
                                      children: [
                                        BlurContainer(
                                          content: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "#${i + 1}",
                                                  style: AppTextStyle
                                                      .w400S20WhiteColor,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  leaders[i].name,
                                                  style: AppTextStyle
                                                      .w400S20WhiteColor,
                                                ),
                                                Text(
                                                  leaders[i].score.toString(),
                                                  style: AppTextStyle
                                                      .w400S20WhiteColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Image.asset(
                                            i % 2 == 0
                                                ? Pictures.top1
                                                : Pictures.top2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 34),
              ],
            ),
    );
  }
}
