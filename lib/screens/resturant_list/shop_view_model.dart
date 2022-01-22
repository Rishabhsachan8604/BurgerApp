import 'package:flutter/material.dart';

import './shop.dart';
import 'model/shop_helper.dart';
import 'model/shop_model.dart';
import 'state/tabbar_change.dart';

abstract class ShopViewModel extends State<Shop> {
  ScrollController scrollController = ScrollController();
  int currentCategoryIndex = 0;
  ScrollController headerScrollController = ScrollController();

  List<ShopModel> shopList = [];

  List<Map> categories = [
    {"categoryName": "Burgers","categoryImage": "assets/images/burger.png", "products":
      [
         {"image":"assets/images/burger.png","name":"JUNIOR","price":3.49},
         {"image":"assets/images/burger.png","name":"SINGLE","price":5.79},
         {"image":"assets/images/burger.png","name":"DOUBLE","price":7.79},
         {"image":"assets/images/burger.png","name":"TRIPLE","price":9.79},
         {"image":"assets/images/burger.png","name":"GRILLED CHEESE","price":5.49},
         {"image":"assets/images/burger.png","name":"VEGAN","price":8.79}
      ]
    },
    {"categoryName": "SIDES","categoryImage": "assets/images/cake.png", "products":
      [
         {"image":"assets/images/cake.png","name":"SMALL FRIES","price":2.49},
         {"image":"assets/images/cake.png","name":"LARGE FRIES","price":3.19},
         {"image":"assets/images/cake.png","name":"SMALL CHEESE FRIES","price":3.49},
        {"image":"assets/images/cake.png","name":"LARGE CHEESE FRIES","price":4.49},
        {"image":"assets/images/cake.png","name":"ROCKET FRIES","price":5.49},
        {"image":"assets/images/cake.png","name":"TOTS","price":2.49}
      ]
    },
    {"categoryName": "BEVERAGE","categoryImage": "assets/images/pizza.png","products":
      [
        {"image":"assets/images/pizza.png","name":"FOUNTAIN","price":2.19},
        {"image":"assets/images/pizza.png","name":"MEXICAN COKE","price":2.99},
        {"image":"assets/images/pizza.png","name":"BOTTLED WATER","price":1.50}
      ]
    },
    {"categoryName": "MILK SHAKES","categoryImage": "assets/images/burger.png","products":
    [
      {"image":"assets/images/burger.png","name":"CHERRY","price":4.99},
      {"image":"assets/images/burger.png","name":"COOKIES & CREAM","price":4.99},
      {"image":"assets/images/burger.png","name":"STRAWBERRY","price":4.99}
    ]
    },

  ];

  @override
  void initState() {
    super.initState();
    shopList = List.generate(
      categories.length,
      (index) => ShopModel(
        categoryName: categories[index]['categoryName'],
        categoryImage: categories[index]['categoryImage'],
        products: List.generate(
          categories[index]['products'].length,
          (index1) => Product("${ categories[index]['products'][index1]['image'] }","${ categories[index]['products'][index1]['name'] }",categories[index]['products'][index1]['price']),
        ),
      ),
    );

    scrollController.addListener(() {
      final index = shopList
          .indexWhere((element) => element.position >= scrollController.offset);
      tabBarNotifier.changeIndex(index);

      headerScrollController.animateTo(
          index * (MediaQuery.of(context).size.width * 0.2),
          duration: Duration(seconds: 1),
          curve: Curves.decelerate);
    });
  }

  void headerListChangePosition(int index) {
    scrollController.animateTo(shopList[index].position,
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  double oneItemHeight = 0;

  void fillListPositionValues(double val) {
    if (oneItemHeight == 0) {
      oneItemHeight = val;
      shopList.asMap().forEach((key, value) {
        if (key == 0) {
          shopList[key].position = 0;
        } else {
          shopList[key].position = getShopListPosition(val, key);
        }
      });
    }
  }

  double getShopListPosition(double val, int index) =>
      val * (shopList[index].products.length / ShopHelper.GRID_COLUMN_VALUE) +
      shopList[index - 1].position;
}
