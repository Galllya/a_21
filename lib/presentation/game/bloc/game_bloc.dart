import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.dart';
part 'game_state.dart';
part 'game_bloc.freezed.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const _Initial()) {
    on<_Started>((event, emit) {
      emit(const GameState.load(score: 0, hearts: 3));
    });
    on<_Lose>((event, emit) {
      int lastHearts = (state as _Load).hearts;
      lastHearts--;
      emit(GameState.load(score: (state as _Load).score, hearts: lastHearts));
    });
    on<_AddScore>((event, emit) {
      int lastScore = (state as _Load).score;
      lastScore += event.value;

      emit(GameState.load(score: lastScore, hearts: (state as _Load).hearts));
    });
    on<_AddHeart>((event, emit) {
      int lastHearts = (state as _Load).hearts;
      lastHearts++;
      emit(GameState.load(score: (state as _Load).score, hearts: lastHearts));
    });
  }
}
