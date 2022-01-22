import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/util/size_config.dart';
import 'package:burger_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  var currentPosition;
  var currentLocationAddress;

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        currentPosition = position;

      });
      getCurrentLocationAddress();
    }).catchError((e) {
      print(e);
    });
  }

  getCurrentLocationAddress() async {
    try {
      List<Placemark> listPlaceMarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = listPlaceMarks[0];

      setState(() {
        currentLocationAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      }
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }
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
                flex: 2,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ConstantColor.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    margin: const EdgeInsets.only(top: 60),
                    child: SingleChildScrollView(
                      child: Column(

                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left:30.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Location',
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                      if (currentPosition != null &&
                                          currentLocationAddress != null)
                                        Text(currentLocationAddress,
                                            style:
                                            Theme.of(context).textTheme.bodyText2),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("or", style: TextStyle(fontSize: 30,), )),
                          ),
                          Container(
                              width: double.infinity,
                              height: SizeConfig.size50,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ConstantColor.primaryColor,
                                      width: 1),
                                  boxShadow: [
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
                                  const Icon(Icons.location_on),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),

                                      child: TextFormField(
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          labelText: "Location ...",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),


                        // if (currentPosition != null) Text("LAT: ${currentPosition.latitude}", style: TextStyle(fontSize: 23),),
                        //   SizedBox(height: 15),
                        //  if (currentPosition != null) Text("LONG: ${currentPosition.longitude}", style: TextStyle(fontSize: 23),),
                        //   SizedBox(height: 15),
                        //  if (currentLocationAddress != null) Text(currentLocationAddress, style: TextStyle(fontSize: 23),),
                         SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                             // getCurrentLocation();
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
                                  gradient: LinearGradient(colors: [
                                    ConstantColor.primaryColor,
                                    Color(0xFFC8161D)
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                width: 250,
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Get location',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
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
