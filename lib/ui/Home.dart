import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, top: 40.0),
        alignment: Alignment.center,
        //alignment orqalik top right left surilaveradi ekan
        //sda
        color: Colors.deepPurple,
        // width: 200.0,
        // height: 100.0,
        // margin: const EdgeInsets.all(20.0),
        // margin: const EdgeInsets.only(left: 20.0),
        child: Column(children: <Widget>[
          Row(
            children: const <Widget>[
              Expanded(
                  child: Text(
                "Spice Jet",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 35.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              )),
              Expanded(
                child: Text(
                  "From Mumbai to Bangalore via new Delhi",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Expanded(
                  child: Text(
                "Spice Jet",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 35.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              )),
              Expanded(
                child: Text(
                  "From Mumbai to Bangalore via new Delhi",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          FlightImageAsset(),
          FlightBookButton()
        ]),
      ),
    );
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/image_my.jpg');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(child: image);
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 300.0,
      height: 50.0,
      child: ElevatedButton(
        child: const Text(
          "Book Your Flight",
          style: TextStyle(
              fontSize: 25.0,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          bookFlight(context);
        },
      ),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Flight Booked Successfully"),
      content: Text("Have a pleasant flight"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

//horizontal view
//Row(
//           children: const <Widget>[
//             Expanded(
//               child: Text(
//                 "Spice Jet",
//                 textDirection: TextDirection.ltr,
//                 style: TextStyle(
//                     decoration: TextDecoration.none,
//                     fontSize: 35.0,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.white),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 "From Mumbai to Bangalore via new Delhi",
//                 textDirection: TextDirection.ltr,
//                 style: TextStyle(
//                     decoration: TextDecoration.none,
//                     fontSize: 20.0,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
