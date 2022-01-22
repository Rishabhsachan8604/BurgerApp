import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/util/forms_utils.dart';
import 'package:burger_app/common/widget/appbar.dart';
import 'package:burger_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


class ProductProfileScreen extends StatefulWidget {
  const ProductProfileScreen({Key? key}) : super(key: key);

  @override
  _ProductProfileScreenState createState() => _ProductProfileScreenState();
}

class _ProductProfileScreenState extends State<ProductProfileScreen> {



  List<Map> categories = [
    {"name": "Burger", "image": "assets/images/burger.png"},
    {"name": "Pizza", "image": "assets/images/pizza.png"},
    {"name": "Cake", "image": "assets/images/cake.png"},
    {"name": "Burger", "image": "assets/images/burger.png"},
    {"name": "Pizza", "image": "assets/images/pizza.png"},
    {"name": "Cake", "image": "assets/images/cake.png"},
  ];







  List<int> verticalData = [];

  final int increment = 5;

  bool isLoadingVertical = false;

  @override
  void initState() {
    _loadMoreVertical();
    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'Chicago IIL',
        height: 50.0,

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child:Stack(
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 15.0,
                          left: 5.0,
                          right: 5.0,
                          bottom: 10.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ConstantColor.black.withOpacity(0.15),
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
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              // padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              // color: ConstantColor.white,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (BuildContext context, int i) {
                  Map category = categories[i];
                  return Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 7.0,
                    ),
                    decoration: BoxDecoration(
                      color: i == 0
                          ? ConstantColor.primaryColor
                          : ConstantColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ConstantColor.black.withOpacity(0.15),
                          offset: Offset(1, 1),
                          blurRadius: 10,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 65.0,
                          width: 65.0,
                          padding: EdgeInsets.all(5.0),
                          color: ConstantColor.white,
                          child: Image.asset(
                            category['image'],
                            height: 60.0,
                          ),
                        ),
                        Text(
                          category['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: i == 0
                                ? ConstantColor.white
                                : ConstantColor.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Burger',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return DemoItem(position);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DemoItem extends StatefulWidget {
  final int position;

  const DemoItem(
      this.position, {
        Key? key,
      }) : super(key: key);

  @override
  _DemoItemState createState() => _DemoItemState();
}

class _DemoItemState extends State<DemoItem> {
  var quantity = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset("assets/images/burger.png", fit: BoxFit.cover),
          ),
          title: Text('Sun'),
          subtitle: Text('Rs.500'),
          trailing: Wrap(
            spacing: 0,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if(quantity > 0)
                      quantity = quantity - 1;
                  });
                },
              ),
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 50,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:ConstantColor.primaryColor, width: 1),
                      boxShadow:  [
                        BoxShadow(
                            color: ConstantColor.primaryColor,
                            blurRadius: 10,
                            offset: Offset(1, 1)),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 25,left: 15),
                          child: TextFormField(
                            maxLines: 1,
                            controller: TextEditingController(text: quantity.toString()),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              hintText:"0",
                              enabled: false,
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity = quantity + 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoItem1 extends StatefulWidget {
  final int position;

  const DemoItem1(
      this.position, {
        Key? key,
      }) : super(key: key);

  @override
  _DemoItem1State createState() => _DemoItem1State();
}

class _DemoItem1State extends State<DemoItem1> {
  var quantity = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset("assets/images/pizza.png", fit: BoxFit.cover),
          ),
          title: Text('Sun'),
          subtitle: Text('Rs.500'),
          trailing: Wrap(
            spacing: 0,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    quantity = quantity - 1;
                  });
                },
              ),
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 40,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:ConstantColor.primaryColor, width: 1),
                      boxShadow:  [
                        BoxShadow(
                            color: ConstantColor.primaryColor,
                            blurRadius: 10,
                            offset: Offset(1, 1)),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 25,left: 10),
                          child: TextFormField(
                            maxLines: 1,
                            controller: TextEditingController(text: quantity.toString()),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,

                            ),
                            decoration: const InputDecoration(
                              hintText:"0",
                              enabled: false,
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity = quantity + 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}