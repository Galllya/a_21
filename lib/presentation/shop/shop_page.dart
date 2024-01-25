import 'package:a1/common/widgets/app_screen.dart';
import 'package:a1/common/widgets/blur_container.dart';
import 'package:a1/common/widgets/custom_app_bar.dart';
import 'package:a1/presentation/shop/widgets/boost_container.dart';
import 'package:a1/presentation/shop/widgets/list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late SharedPreferences sharedPreferences;
  int money = 0;
  List<int> useBack = [];
  List<int> haveBack = [];
  List<int> useBall = [];
  List<int> haveBall = [];
  List<int> useBoots = [];
  List<int> haveBoots = [];
  List<int> useBoost = [];
  List<int> haveBoost = [];
  @override
  void initState() {
    getAllData();
    super.initState();
  }

  void getAllData() {
    print("aaa");
    sharedPreferences = context.read<SharedPreferences>();

    if (sharedPreferences.getString("haveBack") == null) {
      sharedPreferences.setString("haveBack", "0");
      sharedPreferences.setString("haveBall", "0");
      sharedPreferences.setString("haveBoots", "0");
    }
    money = sharedPreferences.getInt("money") ?? 0;
    useBack = [sharedPreferences.getInt("back") ?? 0];
    List<String> haveBackString =
        (sharedPreferences.getString("haveBack") ?? "0").characters.toList();
    haveBackString.forEach(
      (element) {
        haveBack.add(int.parse(element));
      },
    );
    useBall = [sharedPreferences.getInt("ball") ?? 0];
    List<String> haveBallString =
        (sharedPreferences.getString("haveBall") ?? "0").characters.toList();
    haveBallString.forEach(
      (element) {
        haveBall.add(int.parse(element));
      },
    );
    useBoots = [sharedPreferences.getInt("boots") ?? 0];
    List<String> haveBootsString =
        (sharedPreferences.getString("haveBoots") ?? "0").characters.toList();
    haveBootsString.forEach(
      (element) {
        haveBoots.add(int.parse(element));
      },
    );
    List<String> haveBoostString =
        (sharedPreferences.getString("haveBoost") ?? "").characters.toList();
    haveBoostString.forEach(
      (element) {
        haveBoost.add(int.parse(element));
      },
    );
    List<String> boostString =
        (sharedPreferences.getString("boost") ?? "").characters.toList();
    boostString.forEach(
      (element) {
        useBoost.add(int.parse(element));
      },
    );
    setState(() {});
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
                  content: ListView(
                    padding: const EdgeInsets.all(18),
                    children: [
                      ListContainer(
                        onReturn: getAllData,
                        height: 200,
                        count: 5,
                        typeName: "back",
                        haveTypes: haveBack,
                        used: useBack,
                        shadowBorderRadius: 11,
                      ),
                      const SizedBox(height: 9),
                      ListContainer(
                        onReturn: getAllData,
                        height: 120,
                        count: 5,
                        typeName: "ball",
                        haveTypes: haveBall,
                        used: useBall,
                        shadowBorderRadius: 30,
                      ),
                      const SizedBox(height: 9),
                      ListContainer(
                        onReturn: getAllData,
                        height: 120,
                        count: 5,
                        typeName: "boots",
                        haveTypes: haveBoots,
                        used: useBoots,
                        shadowBorderRadius: 0,
                      ),
                      const SizedBox(height: 9),
                      BoostContainer(
                        height: 120,
                        count: 2,
                        typeName: "boost",
                        haveTypes: haveBoost,
                        used: useBoost,
                        shadowBorderRadius: 0,
                      ),
                      const SizedBox(height: 9),
                    ],
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
