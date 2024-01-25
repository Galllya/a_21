import 'package:a1/common/style/app_colors.dart';
import 'package:a1/common/style/app_text_style.dart';
import 'package:a1/common/widgets/app_button.dart';
import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/common/widgets/custom_app_bar.dart';
import 'package:a1/presentation/home/home_page.dart';
import 'package:a1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailShopPage extends StatefulWidget {
  final String title;
  final int index;
  final bool haveIt;

  const DetailShopPage({
    super.key,
    required this.title,
    required this.index,
    required this.haveIt,
  });

  @override
  State<DetailShopPage> createState() => _DetailShopPageState();
}

class _DetailShopPageState extends State<DetailShopPage> {
  late SharedPreferences sharedPreferences;
  int money = 0;

  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    money = sharedPreferences.getInt("money") ?? 0;

    super.initState();
  }

  void use() async {
    sharedPreferences.setInt(widget.title, widget.index);

    await alertDialog("Changes applied")
        .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            ));
  }

  void buy() async {
    if (money >= (20 * (widget.index + 1))) {
      int newMoney = money - (20 * (widget.index + 1));
      sharedPreferences.setInt("money", newMoney);
      String haveType = "have${widget.title.capitalize()}";

      String oldItems = sharedPreferences.getString(haveType) ?? "";
      oldItems += widget.index.toString();
      sharedPreferences.setString(haveType, oldItems);
      await alertDialog("Successful purchase").then(
        (value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      );
    } else {
      alertDialog("Not enough money");
    }
  }

  Future alertDialog(String message) async {
    Widget okButton = AppButton(
      title: "OK",
      onTap: () => Navigator.of(context).pop(),
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.under,
      title: Text(
        message,
        style: AppTextStyle.w700S32WhiteColor,
      ),
      actions: [
        okButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      content: Column(
        children: [
          CustomAppBar(
            money: money,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlurContainer(
                  content: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 51,
                      vertical: 31,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Flexible(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/pictures/${widget.title}_${widget.index}.png",
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 16),
                            if (!widget.haveIt)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Pictures.coin,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    (20 * (widget.index + 1)).toString(),
                                    style: AppTextStyle.w700S32WhiteColor,
                                  ),
                                ],
                              ),
                            const SizedBox(height: 16),
                            if (!(widget.title == "boost" && widget.haveIt))
                              AppButton(
                                title: widget.haveIt ? "USE" : "BUY",
                                onTap: widget.haveIt ? use : buy,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
