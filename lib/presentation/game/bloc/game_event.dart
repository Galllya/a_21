part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.started() = _Started;
  const factory GameEvent.lose() = _Lose;
  const factory GameEvent.addScore(int value) = _AddScore;
  const factory GameEvent.addHeart() = _AddHeart;
}
