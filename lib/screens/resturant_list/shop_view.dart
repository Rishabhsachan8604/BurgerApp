import 'package:burger_app/common/util/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './shop_view_model.dart';
import 'state/tabbar_change.dart';
import 'widget/shop_card.dart';

class ShopView extends ShopViewModel {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("SKY ROCKET BURGER") ,
      ),
      body: SingleChildScrollView(child: buildChangeBody()),
    );
  }

 buildChangeBody() {
    return ChangeNotifierProvider.value(
      value: tabBarNotifier,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Expanded(
              child: Container(
                child:Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 15.0,
                          left: 5.0,
                          right: 5.0,
                          bottom: 15.0,
                        ),
                        padding: EdgeInsets.only(left: 15.0,top: 15.0,bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ConstantColor.black.withOpacity(0),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 2.0,
                            ),
                          ],
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SKY ROCKET BURGER - DALLAS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: ConstantColor.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '111 South Hall Street, Dallas, TX 75226',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ConstantColor.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '(469) 372-6122',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ConstantColor.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Divider(height: 1,thickness: 1,),
          SizedBox(
              height: 180,
              child: Expanded(flex: 5, child: buildListViewHeader)),
          Divider(height: 1,thickness: 1,),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Expanded(flex: 8, child: buildListViewShop)),
        ],
      ),
    );
  }

  ListView get buildListViewShop {
    return ListView.builder(
      controller: scrollController,
      itemCount: shopListAndSpaceAreaLength,
      itemBuilder: (context, index) {
        if (index == shopListLastIndex)
          return emptyWidget;
        else
          return ShopCard(
            model: shopList[index],
            index: index,
            onHeight: (val) {
              fillListPositionValues(val);
            },
          );
      },
    );
  }

  int get shopListAndSpaceAreaLength => shopList.length + 1;

  int get shopListLastIndex => shopList.length;

  Container get emptyWidget => Container(height: oneItemHeight * 2);

  Widget get buildListViewHeader {
    return Consumer<TabBarChange>(
      builder: (context, value, child) => ListView.builder(
        itemCount: shopList.length,
        controller: headerScrollController,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildPaddingHeaderCard(index),
      ),
    );
  }

  Padding buildPaddingHeaderCard(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: RaisedButton(
        color: tabBarNotifier.index == index ? Colors.red : Colors.white,
        onPressed: () => headerListChangePosition(index),

        child:Container(
          width: 70,
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 5.0,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 90.0,
                width: 105.0,
                color: ConstantColor.white,
                child: Image.asset(
                  "${shopList[index].categoryImage}",
                  height: 40.0,
                ),
              ),
              Text(
                "${shopList[index].categoryName}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: index == 0
                      ? ConstantColor.white
                      : ConstantColor.black ,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),

            ],
          ),
        ),
        shape: StadiumBorder(),
      ),
    );
  }
}
