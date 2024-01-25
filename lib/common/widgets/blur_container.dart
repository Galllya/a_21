import 'dart:ui';

import 'package:a1/common/style/app_colors.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget content;
  const BlurContainer({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 5,
          color: AppColors.border.withOpacity(0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.textFieldGradientStart.withOpacity(0.4),
                    AppColors.textFieldGradientEnd.withOpacity(0.4),
                  ],
                ),
              ),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
