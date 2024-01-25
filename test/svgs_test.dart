import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:a1/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.arrow).existsSync(), isTrue);
    expect(File(Svgs.check).existsSync(), isTrue);
    expect(File(Svgs.heartEmpty).existsSync(), isTrue);
    expect(File(Svgs.heartFill).existsSync(), isTrue);
    expect(File(Svgs.menu).existsSync(), isTrue);
    expect(File(Svgs.score).existsSync(), isTrue);
    expect(File(Svgs.star).existsSync(), isTrue);
  });
}
