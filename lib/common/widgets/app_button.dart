import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final int titleSize;
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.titleSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.subButtonStart,
              AppColors.subButtonEnd,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.mainButtonStart,
                  AppColors.mainButtonEnd,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: titleSize == 32
                      ? AppTextStyle.w700S32WhiteColor
                      : AppTextStyle.w700S24WhiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
