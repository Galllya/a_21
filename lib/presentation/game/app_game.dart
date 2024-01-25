import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Draggable;

class AppGame extends FlameGame with HasCollisionDetection {
  final int back;
  final VoidCallback onFinish;
  final bool start;
  final VoidCallback lose;
  final Function(int score) addPoints;
  final int boots;
  final int balls;

  SpriteComponent spriteComponent = SpriteComponent();

  AppGame({
    required this.back,
    required this.onFinish,
    required this.start,
    required this.lose,
    required this.addPoints,
    required this.balls,
    required this.boots,
  });

  double get width => size.x;
  double get height => size.y;

  late final Boot boot;

  late SpriteComponent ball;

  bool ballDown = true;

  @override
  FutureOr<void> onLoad() async {
    add(ScreenHitbox());

    //установка фона
    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite("back_$back.png")
      ..size = size;
    add(background);

    //добавление мяча
    final ballSprite = await loadSprite("ball_$balls.png");
    ball = Ball(
      ballSprite,
      Vector2(width / 2 - 50, 0),
      start,
      lose,
      addPoints,
    );
    add(ball);

    //добавление ботинка
    final bootSprite = await loadSprite("boots_$boots.png");
    Boot boot = Boot(bootSprite, Vector2(width / 3, height - 200));
    add(boot);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (ballDown) {
      ball.y += 1;
      if (ball.y > height - 100) {
        ballDown = false;
      }
    }

    super.update(dt);
  }
}

class Ball extends SpriteComponent
    with HasGameReference<FlameGame>, CollisionCallbacks {
  final bool start;
  final VoidCallback lose;
  final Function(int points) addPoints;

  Ball(
    Sprite sprite,
    Vector2 position,
    this.start,
    this.lose,
    this.addPoints,
  ) : super(
          sprite: sprite,
          size: Vector2(90, 90),
          position: position,
        );

  static const double speed = 500;
  static const degree = math.pi / 180;

  late Vector2 velocity;

  bool canBeat = true;
  @override
  FutureOr<void> onLoad() {
    _resetBall;

    final hitBox = CircleHitbox(
      radius: 45,
    );

    addAll([
      hitBox,
    ]);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.y + 90 >= game.size.y) {
      print("end");
      velocity.x = velocity.x;
      velocity.y = -velocity.y;
      lose();
    }

    if (position.y < 0) {
      velocity.x = velocity.x;
      velocity.y = -velocity.y;
    }
    if (position.x < 0) {
      velocity.x = -velocity.x;
      velocity.y = velocity.y;
    }
    if (position.x + 90 > game.size.x) {
      velocity.x = -velocity.x;
      velocity.y = velocity.y;
    }
  }

  void get _resetBall {
    position = Vector2(game.size.x / 2, 0);
    final spawnAngle = getSpawnAngle;

    final vx = math.cos(spawnAngle * degree) * speed;
    final vy = math.sin(spawnAngle * degree) * speed;
    velocity = Vector2(
      vx,
      vy,
    );
  }

  double get getSpawnAngle {
    final random = math.Random().nextDouble();
    final spawnAngle = lerpDouble(110, 50, random)!;

    return spawnAngle;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    final collisionPoint = intersectionPoints.first;

    if (other is ScreenHitbox) {
      final collisionPoint = intersectionPoints.first;
    } else {
      if ((collisionPoint.y < other.y + 50)) {
        Future.delayed(const Duration(milliseconds: 180), () {
          velocity.y = -velocity.y;
          canBeat = false;
          addPoints(10);
          Future.delayed(
            const Duration(milliseconds: 1000),
            () {
              velocity.y = -velocity.y;
              velocity.x = -velocity.x;
            },
          );
        });
      }
    }
  }
}

class Boot extends SpriteComponent
    with HasGameReference<FlameGame>, DragCallbacks, CollisionCallbacks {
  Boot(Sprite sprite, Vector2 position)
      : super(
          sprite: sprite,
          position: position,
          size: Vector2(120, 120),
          angle: 0,
        );

  late ShapeHitbox hitbox;
  bool rotate = false;
  bool rotateDown = false;
  List<Vector2> positions = [];

  @override
  FutureOr<void> onLoad() {
    hitbox = RectangleHitbox(
      size: Vector2(120, 60),
    );

    add(hitbox);
    return super.onLoad();
  }

  List<int> xs = [0];

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (rotate) {
      angle += 0.05;
    }
    if (rotateDown) {
      angle -= 0.05;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    final collisionPoint = intersectionPoints.first;

    if (other is! ScreenHitbox && (collisionPoint.y > other.y + 50)) {
      rotate = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        rotate = false;
        rotateDown = true;
        Future.delayed(const Duration(milliseconds: 200), () {
          rotateDown = false;
        });
      });
    }
  }
}
