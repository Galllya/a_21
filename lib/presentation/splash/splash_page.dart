import 'dart:async';

import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/presentation/name/name_page.dart';
import 'package:a1/presentation/onbording/onbording_page.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int percent = 0;
  late Timer timer;
  late bool openOnbording;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    onbordingCheck();
    timer = Timer.periodic(
      const Duration(milliseconds: 20),
      (timer) {
        percent++;
        setState(() {});
        if (percent == 100) {
          timer.cancel();
          openNextPage();
        }
      },
    );
    super.initState();
  }

  void onbordingCheck() {
    openOnbording = sharedPreferences.getBool("openOnbording") ?? true;
  }

  void openNextPage() async {
    if (openOnbording) {
      await sharedPreferences.setBool("openOnbording", false);
      open(const OnbordingPage());
    } else {
      open(const NamePage());
    }
  }

  void open(Widget page) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOADING...",
            style: AppTextStyle.w700S24WhiteColor,
          ),
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GradientProgressBar(
                  percent: percent,
                  gradient: Gradients.buildGradient(
                    Alignment.topCenter,
                    Alignment.bottomCenter,
                    [
                      AppColors.linerBegin,
                      AppColors.linerEnd,
                    ],
                  ),
                  backgroundColor: AppColors.under,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientProgressBar extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final LinearGradient gradient;
  final Color backgroundColor;

  const GradientProgressBar(
      {required this.percent,
      required this.gradient,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.4),
                inset: true,
              ),
            ],
          ),
          child: const SizedBox(height: 20),
        ),
        Row(
          children: [
            Flexible(
              flex: percent,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const SizedBox(height: 20),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 100 - percent,
              child: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}
