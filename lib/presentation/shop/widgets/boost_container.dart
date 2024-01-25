import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/shop/detail_shop_page.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class BoostContainer extends StatelessWidget {
  final double height;
  final int count;
  final String typeName;
  final List<int> haveTypes;
  final List<int> used;
  final double shadowBorderRadius;
  const BoostContainer({
    super.key,
    required this.height,
    required this.count,
    required this.typeName,
    required this.haveTypes,
    required this.used,
    required this.shadowBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      content: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < count; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (haveTypes.contains(i)) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailShopPage(
                              haveIt: true,
                              title: typeName,
                              index: i,
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailShopPage(
                              haveIt: false,
                              title: typeName,
                              index: i,
                            ),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 6,
                                  top: 6,
                                ),
                                child: ClipRRect(
                                  borderRadius: shadowBorderRadius == 0
                                      ? BorderRadius.zero
                                      : BorderRadius.circular(
                                          shadowBorderRadius),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 4),
                                          blurRadius: 4,
                                          color: shadowBorderRadius == 0
                                              ? Colors.transparent
                                              : Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      "assets/pictures/${typeName}_$i.png",
                                    ),
                                  ),
                                ),
                              ),
                              if (haveTypes.contains(i))
                                Positioned(
                                  left: -4,
                                  child: Image.asset(Pictures.star),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          used.contains(i) ? "USE" : "",
                          style: AppTextStyle.w300S26WhiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
