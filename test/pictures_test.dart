import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:a1/resources/resources.dart';

void main() {
  test('pictures assets test', () {
    expect(File(Pictures.back0).existsSync(), isTrue);
    expect(File(Pictures.back1).existsSync(), isTrue);
    expect(File(Pictures.back2).existsSync(), isTrue);
    expect(File(Pictures.back3).existsSync(), isTrue);
    expect(File(Pictures.back4).existsSync(), isTrue);
    expect(File(Pictures.background1).existsSync(), isTrue);
    expect(File(Pictures.ball0Copy).existsSync(), isTrue);
    expect(File(Pictures.ball0).existsSync(), isTrue);
    expect(File(Pictures.ball1Copy).existsSync(), isTrue);
    expect(File(Pictures.ball1).existsSync(), isTrue);
    expect(File(Pictures.ball2Copy).existsSync(), isTrue);
    expect(File(Pictures.ball2).existsSync(), isTrue);
    expect(File(Pictures.ball3Copy).existsSync(), isTrue);
    expect(File(Pictures.ball3).existsSync(), isTrue);
    expect(File(Pictures.ball4Copy).existsSync(), isTrue);
    expect(File(Pictures.ball4).existsSync(), isTrue);
    expect(File(Pictures.boost0Copy).existsSync(), isTrue);
    expect(File(Pictures.boost0).existsSync(), isTrue);
    expect(File(Pictures.boost1Copy).existsSync(), isTrue);
    expect(File(Pictures.boost1).existsSync(), isTrue);
    expect(File(Pictures.boots0Copy).existsSync(), isTrue);
    expect(File(Pictures.boots0).existsSync(), isTrue);
    expect(File(Pictures.boots1Copy).existsSync(), isTrue);
    expect(File(Pictures.boots1).existsSync(), isTrue);
    expect(File(Pictures.boots2Copy).existsSync(), isTrue);
    expect(File(Pictures.boots2).existsSync(), isTrue);
    expect(File(Pictures.boots3Copy).existsSync(), isTrue);
    expect(File(Pictures.boots3).existsSync(), isTrue);
    expect(File(Pictures.boots4Copy).existsSync(), isTrue);
    expect(File(Pictures.boots4).existsSync(), isTrue);
    expect(File(Pictures.coin).existsSync(), isTrue);
    expect(File(Pictures.emptyCheck).existsSync(), isTrue);
    expect(File(Pictures.instruction1).existsSync(), isTrue);
    expect(File(Pictures.instruction2).existsSync(), isTrue);
    expect(File(Pictures.medal).existsSync(), isTrue);
    expect(File(Pictures.menu).existsSync(), isTrue);
    expect(File(Pictures.onbording).existsSync(), isTrue);
    expect(File(Pictures.poly).existsSync(), isTrue);
    expect(File(Pictures.star).existsSync(), isTrue);
    expect(File(Pictures.top1).existsSync(), isTrue);
    expect(File(Pictures.top2).existsSync(), isTrue);
  });
}
