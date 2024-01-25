import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/common/widgets/custom_app_bar.dart';
import 'package:a1/presentation/custom_web_view/custom_web_view_page.dart';
import 'package:a1/presentation/setting/bloc/settings_bloc.dart';
import 'package:a1/resources/resources.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late SettingsBloc _settingsBloc;
  @override
  void initState() {
    _settingsBloc = SettingsBloc(
      sharedPreferences: context.read<SharedPreferences>(),
      flameAudio: context.read<Bgm>(),
    );
    _settingsBloc.add(const SettingsEvent.started());

    super.initState();
  }

  void openWebView(String url) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CustomWebViewPage(url: url),
        ),
      );

  void shareApp() {
    Share.share('Install the application: {there will be a link here}');
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(height: 40),
          BlocBuilder<SettingsBloc, SettingsState>(
            bloc: _settingsBloc,
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loaded: (backgroundSoundActive) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: BlurContainer(
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Music",
                                  style: AppTextStyle.w700S32WhiteColor,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (backgroundSoundActive) {
                                      _settingsBloc.add(
                                        const SettingsEvent.turnOffSound(),
                                      );
                                    } else {
                                      _settingsBloc.add(
                                        const SettingsEvent.turnOnSound(),
                                      );
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        Pictures.emptyCheck,
                                      ),
                                      Opacity(
                                        opacity: backgroundSoundActive ? 1 : 0,
                                        child: SvgPicture.asset(Svgs.check),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 36),
                            AppButton(
                              title: "Privacy Policy",
                              titleSize: 24,
                              onTap: () => openWebView(
                                "https://www.google.com/",
                              ),
                            ),
                            const SizedBox(height: 17),
                            AppButton(
                              title: "TERMS of use",
                              titleSize: 24,
                              onTap: () => openWebView(
                                "https://www.google.com/",
                              ),
                            ),
                            const SizedBox(height: 25),
                            AppButton(
                              title: "share app".toUpperCase(),
                              titleSize: 24,
                              onTap: () => shareApp(),
                            ),
                            const SizedBox(height: 37),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
