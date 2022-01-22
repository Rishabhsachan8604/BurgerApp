import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/util/size_config.dart';
import 'package:burger_app/screens/main_screen.dart';
import 'package:burger_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Sky Rocket Burger, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                 //   horizontal: getProportionateScreenWidth(20)),
                  horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 4),

                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(ConstantColor.primaryColor),
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new SignInScreen())); },
                      child: Text('Continue'),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 100 : 70,
      decoration: BoxDecoration(
        color: currentPage == index ? ConstantColor.primaryColor : ConstantColor.secondaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
