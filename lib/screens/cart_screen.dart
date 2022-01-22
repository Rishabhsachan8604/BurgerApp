import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<String> listImages = [
  "https://images.unsplash.com/photo-1572537165377-627a37043464?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572204292164-b35ba943fca7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1590254553792-7e91903c5357?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1548586196-aa5803b77379?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572447454458-e68d82f828b3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572204304559-b5f5380482c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA4fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1554516829-a3fce6ddbc6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1563642421748-5047b6585a4a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY2fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1593439147804-c6c7656530ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzUzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStackAppbar(title: "Cart"),
      body: ListView(
        children: <Widget>[

          Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  physics: ScrollPhysics(),
                  itemCount: listImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/logo.png",
                          image: listImages[index],fit: BoxFit.cover,),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                  }),
            ),
          ),
        ],
      ));
  }
}
