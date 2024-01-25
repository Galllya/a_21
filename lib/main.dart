import 'dart:math';

import 'package:a1/common/style/app_theme.dart';
import 'package:a1/presentation/game/bloc/game_bloc.dart';
import 'package:a1/presentation/splash/splash_page.dart';
import 'package:a1/service/audio_service.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setPortraitUpOnly();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  bool shoudRequestReview = sharedPreferences.getBool("review") ?? true;
  if (shoudRequestReview) {
    int time = Random().nextInt(60) + 30;

    Future.delayed(Duration(seconds: time), () async {
      final InAppReview inAppReview = InAppReview.instance;
      sharedPreferences.setBool("review", false);
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      }
    });
  }

  Bgm flameAudio = FlameAudio.bgm;
  flameAudio.initialize();

  AudioService(
    sharedPreferences: sharedPreferences,
    flameAudio: flameAudio,
  ).initAudio();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(
          create: (BuildContext context) => GameBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<SharedPreferences>(
            create: ((context) => sharedPreferences),
          ),
          Provider<Bgm>.value(value: flameAudio),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
