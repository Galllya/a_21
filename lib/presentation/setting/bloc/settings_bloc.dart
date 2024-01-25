import 'package:bloc/bloc.dart';
import 'package:flame_audio/bgm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences sharedPreferences;
  final Bgm flameAudio;
  SettingsBloc({
    required this.sharedPreferences,
    required this.flameAudio,
  }) : super(const _Initial()) {
    on<_Started>((event, emit) => _mapStarted(event, emit));
    on<_TurnOnSound>((event, emit) => _mapTurnOnSound(event, emit));
    on<_TurnOffSound>((event, emit) => _mapTurnOffSound(event, emit));
  }

  void _mapStarted(_Started event, Emitter emit) {
    bool backgroundSoundActive =
        sharedPreferences.getBool("backgroundSound") ?? false;
    emit(
      SettingsState.loaded(backgroundSoundActive: backgroundSoundActive),
    );
  }

  void _mapTurnOnSound(_TurnOnSound event, Emitter emit) async {
    await sharedPreferences.setBool("backgroundSound", true);
    await flameAudio.resume();
    emit(
      const SettingsState.loaded(backgroundSoundActive: true),
    );
  }

  void _mapTurnOffSound(_TurnOffSound event, Emitter emit) async {
    await sharedPreferences.setBool("backgroundSound", false);
    await flameAudio.pause();

    emit(
      const SettingsState.loaded(backgroundSoundActive: false),
    );
  }
}
