part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.initial() = _Initial;
  const factory GameState.load({
    required int score,
    required int hearts,
  }) = _Load;
}
