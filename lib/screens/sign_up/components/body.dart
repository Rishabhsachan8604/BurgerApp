import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/util/size_config.dart';
import 'package:burger_app/screens/main_screen.dart';
import 'package:burger_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFC8161D),
                  ConstantColor.primaryColor,

                ])),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),

            Expanded(
              flex: 3,
              child: Container(
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      color:ConstantColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  margin: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),

                        Container(
                            width: double.infinity,
                            height: SizeConfig.size50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:ConstantColor.primaryColor, width: 1),
                                boxShadow:  [
                                  BoxShadow(
                                      color:ConstantColor.primaryColor,
                                      blurRadius: 10,
                                      offset: Offset(1, 1)),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.email_outlined),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        labelText: "E-mail ...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            width: double.infinity,
                            height: SizeConfig.size50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
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
                                const Icon(Icons.password_outlined),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        labelText: "Password ...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),

                        Container(
                            width: double.infinity,
                            height: SizeConfig.size50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
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
                                const Icon(Icons.password_outlined),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        labelText: "Confirm Password ...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),


                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new MainPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              onPrimary: ConstantColor.primaryColor,
                              shadowColor: ConstantColor.primaryColor,
                              elevation: 18,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient:  LinearGradient(colors: [
                                  ConstantColor.primaryColor,
                                  Color(0xFFC8161D)
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: 200,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(
                          height:20,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(ConstantColor.primaryColor),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new SignInScreen())); },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
