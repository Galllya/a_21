import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/presentation/shop/detail_shop_page.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  final double height;
  final int count;
  final String typeName;
  final List<int> haveTypes;
  final List<int> used;
  final double shadowBorderRadius;
  final VoidCallback onReturn;
  const ListContainer({
    super.key,
    required this.height,
    required this.count,
    required this.typeName,
    required this.haveTypes,
    required this.used,
    required this.shadowBorderRadius,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      content: SizedBox(
        height: height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(6),
          children: [
            for (int i = 0; i < count; i++)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () async {
                    if (haveTypes.contains(i)) {
                      await Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => DetailShopPage(
                                haveIt: true,
                                title: typeName,
                                index: i,
                              ),
                            ),
                          )
                          .then((value) => onReturn());
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
                                    : BorderRadius.circular(shadowBorderRadius),
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
    );
  }
}
