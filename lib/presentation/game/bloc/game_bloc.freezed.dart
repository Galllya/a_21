// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() lose,
    required TResult Function(int value) addScore,
    required TResult Function() addHeart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? lose,
    TResult? Function(int value)? addScore,
    TResult? Function()? addHeart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? lose,
    TResult Function(int value)? addScore,
    TResult Function()? addHeart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Lose value) lose,
    required TResult Function(_AddScore value) addScore,
    required TResult Function(_AddHeart value) addHeart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Lose value)? lose,
    TResult? Function(_AddScore value)? addScore,
    TResult? Function(_AddHeart value)? addHeart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Lose value)? lose,
    TResult Function(_AddScore value)? addScore,
    TResult Function(_AddHeart value)? addHeart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GameEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() lose,
    required TResult Function(int value) addScore,
    required TResult Function() addHeart,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? lose,
    TResult? Function(int value)? addScore,
    TResult? Function()? addHeart,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? lose,
    TResult Function(int value)? addScore,
    TResult Function()? addHeart,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Lose value) lose,
    required TResult Function(_AddScore value) addScore,
    required TResult Function(_AddHeart value) addHeart,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Lose value)? lose,
    TResult? Function(_AddScore value)? addScore,
    TResult? Function(_AddHeart value)? addHeart,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Lose value)? lose,
    TResult Function(_AddScore value)? addScore,
    TResult Function(_AddHeart value)? addHeart,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GameEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoseImplCopyWith<$Res> {
  factory _$$LoseImplCopyWith(
          _$LoseImpl value, $Res Function(_$LoseImpl) then) =
      __$$LoseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoseImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$LoseImpl>
    implements _$$LoseImplCopyWith<$Res> {
  __$$LoseImplCopyWithImpl(_$LoseImpl _value, $Res Function(_$LoseImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoseImpl implements _Lose {
  const _$LoseImpl();

  @override
  String toString() {
    return 'GameEvent.lose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() lose,
    required TResult Function(int value) addScore,
    required TResult Function() addHeart,
  }) {
    return lose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? lose,
    TResult? Function(int value)? addScore,
    TResult? Function()? addHeart,
  }) {
    return lose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? lose,
    TResult Function(int value)? addScore,
    TResult Function()? addHeart,
    required TResult orElse(),
  }) {
    if (lose != null) {
      return lose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Lose value) lose,
    required TResult Function(_AddScore value) addScore,
    required TResult Function(_AddHeart value) addHeart,
  }) {
    return lose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Lose value)? lose,
    TResult? Function(_AddScore value)? addScore,
    TResult? Function(_AddHeart value)? addHeart,
  }) {
    return lose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Lose value)? lose,
    TResult Function(_AddScore value)? addScore,
    TResult Function(_AddHeart value)? addHeart,
    required TResult orElse(),
  }) {
    if (lose != null) {
      return lose(this);
    }
    return orElse();
  }
}

abstract class _Lose implements GameEvent {
  const factory _Lose() = _$LoseImpl;
}

/// @nodoc
abstract class _$$AddScoreImplCopyWith<$Res> {
  factory _$$AddScoreImplCopyWith(
          _$AddScoreImpl value, $Res Function(_$AddScoreImpl) then) =
      __$$AddScoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$AddScoreImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$AddScoreImpl>
    implements _$$AddScoreImplCopyWith<$Res> {
  __$$AddScoreImplCopyWithImpl(
      _$AddScoreImpl _value, $Res Function(_$AddScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AddScoreImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddScoreImpl implements _AddScore {
  const _$AddScoreImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'GameEvent.addScore(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddScoreImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddScoreImplCopyWith<_$AddScoreImpl> get copyWith =>
      __$$AddScoreImplCopyWithImpl<_$AddScoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() lose,
    required TResult Function(int value) addScore,
    required TResult Function() addHeart,
  }) {
    return addScore(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? lose,
    TResult? Function(int value)? addScore,
    TResult? Function()? addHeart,
  }) {
    return addScore?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? lose,
    TResult Function(int value)? addScore,
    TResult Function()? addHeart,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Lose value) lose,
    required TResult Function(_AddScore value) addScore,
    required TResult Function(_AddHeart value) addHeart,
  }) {
    return addScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Lose value)? lose,
    TResult? Function(_AddScore value)? addScore,
    TResult? Function(_AddHeart value)? addHeart,
  }) {
    return addScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Lose value)? lose,
    TResult Function(_AddScore value)? addScore,
    TResult Function(_AddHeart value)? addHeart,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(this);
    }
    return orElse();
  }
}

abstract class _AddScore implements GameEvent {
  const factory _AddScore(final int value) = _$AddScoreImpl;

  int get value;
  @JsonKey(ignore: true)
  _$$AddScoreImplCopyWith<_$AddScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddHeartImplCopyWith<$Res> {
  factory _$$AddHeartImplCopyWith(
          _$AddHeartImpl value, $Res Function(_$AddHeartImpl) then) =
      __$$AddHeartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddHeartImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$AddHeartImpl>
    implements _$$AddHeartImplCopyWith<$Res> {
  __$$AddHeartImplCopyWithImpl(
      _$AddHeartImpl _value, $Res Function(_$AddHeartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddHeartImpl implements _AddHeart {
  const _$AddHeartImpl();

  @override
  String toString() {
    return 'GameEvent.addHeart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddHeartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() lose,
    required TResult Function(int value) addScore,
    required TResult Function() addHeart,
  }) {
    return addHeart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? lose,
    TResult? Function(int value)? addScore,
    TResult? Function()? addHeart,
  }) {
    return addHeart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? lose,
    TResult Function(int value)? addScore,
    TResult Function()? addHeart,
    required TResult orElse(),
  }) {
    if (addHeart != null) {
      return addHeart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Lose value) lose,
    required TResult Function(_AddScore value) addScore,
    required TResult Function(_AddHeart value) addHeart,
  }) {
    return addHeart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Lose value)? lose,
    TResult? Function(_AddScore value)? addScore,
    TResult? Function(_AddHeart value)? addHeart,
  }) {
    return addHeart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Lose value)? lose,
    TResult Function(_AddScore value)? addScore,
    TResult Function(_AddHeart value)? addHeart,
    required TResult orElse(),
  }) {
    if (addHeart != null) {
      return addHeart(this);
    }
    return orElse();
  }
}

abstract class _AddHeart implements GameEvent {
  const factory _AddHeart() = _$AddHeartImpl;
}

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int score, int hearts) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int score, int hearts)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int score, int hearts)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Load value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GameState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int score, int hearts) load,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int score, int hearts)? load,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int score, int hearts)? load,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) load,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Load value)? load,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int score, int hearts});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? hearts = null,
  }) {
    return _then(_$LoadImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      hearts: null == hearts
          ? _value.hearts
          : hearts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({required this.score, required this.hearts});

  @override
  final int score;
  @override
  final int hearts;

  @override
  String toString() {
    return 'GameState.load(score: $score, hearts: $hearts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.hearts, hearts) || other.hearts == hearts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score, hearts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int score, int hearts) load,
  }) {
    return load(score, hearts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int score, int hearts)? load,
  }) {
    return load?.call(score, hearts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int score, int hearts)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(score, hearts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements GameState {
  const factory _Load({required final int score, required final int hearts}) =
      _$LoadImpl;

  int get score;
  int get hearts;
  @JsonKey(ignore: true)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
