import 'package:burger_app/common/util/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:burger_app/screens/resturant_list/model/shop_helper.dart';
import 'package:burger_app/screens/resturant_list/model/shop_model.dart';

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
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset("${products[position].image}", fit: BoxFit.cover),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Text(products[position].name,style:TextStyle(fontSize: 14),),
              ),
              subtitle: Text(products[position].price.toString(),style:TextStyle(fontSize: 17),),
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
        );;
      },
    );
  }
}
