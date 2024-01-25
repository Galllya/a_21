import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/back_button.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final int? money;
  const CustomAppBar({
    super.key,
    this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 23,
        right: 23,
        top: 44,
        bottom: 23,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppBackButton(),
          if (money != null)
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 180,
                    child: BlurContainer(
                      content: Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              money.toString(),
                              style: AppTextStyle.w700S32WhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  Pictures.coin,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
