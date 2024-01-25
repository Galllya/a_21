import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final Widget content;
  final String back;
  const AppScreen({
    super.key,
    required this.content,
    this.back = Pictures.background1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  back,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          content,
        ],
      ),
    );
  }
}
