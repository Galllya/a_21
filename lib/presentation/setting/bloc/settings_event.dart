part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.turnOnSound() = _TurnOnSound;
  const factory SettingsEvent.turnOffSound() = _TurnOffSound;
}
