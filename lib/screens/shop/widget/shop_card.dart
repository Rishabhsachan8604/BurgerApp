import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:burger_app/screens/shop/model/shop_helper.dart';
import 'package:burger_app/screens/shop/model/shop_model.dart';

class ShopCard extends StatefulWidget {
  final ShopModel model;
  final int index;
  final Function(double val) onHeight;

  const ShopCard({Key? key, required this.model, required this.index, required this.onHeight})
      : super(key: key);

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      widget.onHeight((context.size!.height) /
          (widget.model.products.length / ShopHelper.GRID_COLUMN_VALUE));
    });
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left:35.0,top: 16.0,bottom: 16.0),

          child: SizedBox(
            width: double.infinity,
            child: Text(
              "${widget.model.categoryName} ",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Card(
          child: buildGridViewProducts(widget.index, widget.model.products),
        ),
      ],
    );
  }

  ListView buildGridViewProducts(int index, List<Product> products) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.model.products.length,
      itemBuilder: (context, position) {

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(

            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 64,
                  minHeight: 64,
                  maxWidth: 84,
                  maxHeight: 84,
                ),
                child: Image.asset("${products[position].image}", fit: BoxFit.cover),
              ),

              title: Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Text(products[position].name,style:TextStyle(fontSize: 14),),
              ),
              subtitle: Text("\$ ${ products[position].price.toString()}",style:TextStyle(fontSize: 17),),
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpansionPanelDemo()),
                );


                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       shape: RoundedRectangleBorder(
                //           borderRadius:
                //           BorderRadius.all(
                //               Radius.circular(10.0))),
                //       insetPadding: EdgeInsets.zero,
                //       contentPadding: EdgeInsets.only(left: 10),
                //       clipBehavior: Clip.antiAliasWithSaveLayer,
                //       content: DynamicallyCheckbox(),
                //
                //      );
                //   },
                // );
              },
            ),
          ),
        );
      },
    );
  }

}
class DynamicallyCheckbox extends StatefulWidget {

  // Generate a list of available hobbies here
  @override
  _DynamicallyCheckboxState createState() => _DynamicallyCheckboxState();
}

class _DynamicallyCheckboxState extends State<DynamicallyCheckbox> {
  List<Map> availableHobbies = [
    {
      "name": "BBQ Sauce",
      "price": "1.7",
      "isChecked": false
    },
    {
      "name": "Grilled Jalapenos",
      "price": "2.9",
      "isChecked": false
    },
    {
      "name": "Grilled Onions",
      "price": "3.1",
      "isChecked": false,
    },
    {
      "name": "Hot Sauce",
      "price": "0.3",
      "isChecked": false
    },
    {
      "name": "Jalapenos",
      "price": "2.3",
      "isChecked": false
    },
    {
      "name": "Ketchup",
      "price": "2.9",
      "isChecked": false
    },
    {
      "name": "Mustard",
      "price": "3.1",
      "isChecked": false,
    },
    {
      "name": "Raw Onions",
      "price": "0.3",
      "isChecked": false
    },
    {
      "name": "Spicy Mayo",
      "price": "2.3",
      "isChecked": false
    }
  ];

  List<Map> availableHobbies1 = [
    {
      "name": "Fried Egg",
      "price": "1.0",
      "isChecked": false
    },
    {
      "name": "Bacon",
      "price": "1.25",
      "isChecked": false
    },
    {
      "name": "1/4 lb Patty",
      "price": "2.0",
      "isChecked": false,
    },
    {
      "name": "Extra Bacon",
      "price": "2.5",
      "isChecked": false
    },
    {
      "name": "Texas Toast",
      "price": "1.0",
      "isChecked": false
    },
    {
      "name": "Lettuce Wrapped",
      "price": "1.0",
      "isChecked": false,
    },
    {
      "name": "Extra Cheddar",
      "price": "1.5",
      "isChecked": false
    },
    {
      "name": "Extra Cheese",
      "price": "0.5",
      "isChecked": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:5,bottom: 15),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/burger1.png',
                fit: BoxFit.fitWidth,
             ),
              Text(
                'Junior',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Add (+)',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),

          // The checkboxes will be here
          Column(
              children: availableHobbies.map((hobby) {
                return CheckboxListTile(
                    title:  Text(hobby["name"]),
                    subtitle: Text("\$ ${hobby['price'].toString()}"),
                    autofocus: false,
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                    selected:  hobby["isChecked"],
                    value:  hobby["isChecked"],
                    onChanged: (newValue) {
                      setState(() {
                        hobby["isChecked"] = newValue;
                      });
                    });
              }).toList()),
          // Display the result here
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Prem. Adds (++)',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),

          // The checkboxes will be here
          Column(
              children: availableHobbies1.map((hobby) {
                return CheckboxListTile(
                    title:  Text(hobby["name"]),
                    subtitle: Text("\$ ${hobby["price"].toString()}"),
                    autofocus: false,
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                    selected:  hobby["isChecked"],
                    value:  hobby["isChecked"],
                    onChanged: (newValue) {
                      setState(() {
                        hobby["isChecked"] = newValue;
                      });
                    });
              }).toList()),
          // Display the result here
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: (){ },
            child: Text("Add to Cart"),
          ),


        ]),
      ),
    );
  }
}


class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _books = generateItems(8);
  List<Map> availableHobbies = [
    {
      "name": "BBQ Sauce",
      "price": "1.7",
      "isChecked": false
    },
    {
      "name": "Grilled Jalapenos",
      "price": "2.9",
      "isChecked": false
    },
    {
      "name": "Grilled Onions",
      "price": "3.1",
      "isChecked": false,
    },
    {
      "name": "Hot Sauce",
      "price": "0.3",
      "isChecked": false
    },
    {
      "name": "Jalapenos",
      "price": "2.3",
      "isChecked": false
    },
    {
      "name": "Ketchup",
      "price": "2.9",
      "isChecked": false
    },
    {
      "name": "Mustard",
      "price": "3.1",
      "isChecked": false,
    },
    {
      "name": "Raw Onions",
      "price": "0.3",
      "isChecked": false
    },
    {
      "name": "Spicy Mayo",
      "price": "2.3",
      "isChecked": false
    }
  ];

  List<Map> availableHobbies1 = [
    {
      "name": "Fried Egg",
      "price": "1.0",
      "isChecked": false
    },
    {
      "name": "Bacon",
      "price": "1.25",
      "isChecked": false
    },
    {
      "name": "1/4 lb Patty",
      "price": "2.0",
      "isChecked": false,
    },
    {
      "name": "Extra Bacon",
      "price": "2.5",
      "isChecked": false
    },
    {
      "name": "Texas Toast",
      "price": "1.0",
      "isChecked": false
    },
    {
      "name": "Lettuce Wrapped",
      "price": "1.0",
      "isChecked": false,
    },
    {
      "name": "Extra Cheddar",
      "price": "1.5",
      "isChecked": false
    },
    {
      "name": "Extra Cheese",
      "price": "0.5",
      "isChecked": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStackAppbar(title: "Junior"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
             _buildHeader(),
             _buildPanel()
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildHeader(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.asset(
            'assets/images/burger1.png',
            height: 300,
          ),

        ],
      ),
    );
  }
  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _books[index].isExpanded = !isExpanded;
            });
          },
          children: _books.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    title: Text(item.headerValue, style: TextStyle(color: Colors.black)
                  ),
                );
              },
              body: Column(
                  children: availableHobbies.map((hobby) {
                    return CheckboxListTile(
                        title:  Text(hobby["name"],style: TextStyle(fontSize: 14),),
                        subtitle: Text("\$ ${hobby['price'].toString()}"),
                        autofocus: false,
                        activeColor: Colors.red,
                        checkColor: Colors.white,
                        selected:  hobby["isChecked"],
                        value:  hobby["isChecked"],
                        onChanged: (newValue) {
                          setState(() {
                            hobby["isChecked"] = newValue;
                          });
                        });
                  }).toList(),),
              // Display the result here

              isExpanded: item.isExpanded,
            );
          }).toList(),

        ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: (){ },
            child: Text("Add to Cart", style:TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // This is what you need!
            ),
               ),


      ],
    );

  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'ADD On $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}