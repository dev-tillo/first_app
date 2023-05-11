import 'package:first_app/ui/first_screen.dart';
import 'package:flutter/material.dart';
import 'ui/Home.dart';

void main() {
  //home ui template
  // runApp(MaterialApp(title: "Exploring Widget UI", home: Home()));

  // runApp(MaterialApp( listview template
  //     title: "Exploring Widget UI",
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Basic List View"),
  //       ),
  //       body: getListView(),
  //     )));

  // runApp(
  //   MaterialApp(
  //     title: "Exploring UI Widgets",
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("Long List"),
  //       ),
  //       body: getListView(),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed: () {
  //           debugPrint("FAB clicked");
  //         },
  //         child: Icon(Icons.add),
  //         tooltip: 'Add one more Item',
  //       ),
  //     ),
  //   ),
  // );

  // runApp(MaterialApp(
  //   title: "Sateful app Example",
  //   home: FavoriteCity(),
  // ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator App",
    home: SIFrom(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
  ));
}

class SIFrom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFromState();
  }
}

class _SIFromState extends State<SIFrom> {
  final _fromKey = GlobalKey<FormState>();

  var currency = ["Rupees", "Dollars", "Pounds"];
  final _minimumPadding = 5.0;
  var currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    currentItemSelected = currency[0];
  }

  TextEditingController textEditingController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Ineterest Calculator"),
        ),
        body: Form(
          key: _fromKey,
          child: Padding(
            //Container
            // margin: EdgeInsets.all(_minimumPadding * 2),
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: textEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter principal amount';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          hintText: 'Enter Principal e.g 12000',
                          labelStyle: textStyle,
                          errorStyle:
                              TextStyle(color: Colors.yellow, fontSize: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: roiController,
                      style: textStyle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Rate of Interest amount';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Rate of Interest',
                          hintText: 'In percent',
                          labelStyle: textStyle,
                          errorStyle:
                              TextStyle(fontSize: 15.0, color: Colors.yellow),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: termController,
                            style: textStyle,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Term years';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.yellow),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            items: currency.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: currentItemSelected,
                            onChanged: (String? newValueSelected) {
                              onDropDownSelected(newValueSelected!);
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _minimumPadding * 5, top: _minimumPadding * 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: MaterialButton(
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_fromKey.currentState!.validate()) {
                                this.displayResult = calculateTotalReturns();
                              }
                            });
                          },
                          child: const Text(
                            'Calculate',
                            textScaleFactor: 1.5,
                          ),
                        )),
                        Expanded(
                            child: MaterialButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            setState(() {
                              clearState();
                            });
                          },
                          child: const Text(
                            'Reset',
                            textScaleFactor: 1.5,
                          ),
                        ))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: Text(
                    this.displayResult,
                    style: textStyle,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/money.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void onDropDownSelected(String newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }

  String calculateTotalReturns() {
    var parse = double.parse(textEditingController.text);
    var parse2 = double.parse(roiController.text);
    var parse3 = double.parse(termController.text);

    double totalAmountPayable = parse + (parse * parse2 * parse3) / 100;

    String result =
        'After $parse3 years,your investment will be worth $totalAmountPayable $currentItemSelected';

    return result;
  }

  void clearState() {
    textEditingController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    currentItemSelected = currency[0];
  }
}

// class FavoriteCity extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _FavouriteCityState();
//   }
// }
//
// class _FavouriteCityState extends State<FavoriteCity> {
//
//   String name = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Statelful App Example"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             TextField(
//               onChanged: (String userInt) {
//                 setState(() {
//                   name = userInt;
//                 });
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Text(
//                 "Your next city is $name",
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//autoFill Listview and FloatingActionBar and snackBar
// void showSnackBar(BuildContext context, String name) {
//   var snackBar = SnackBar(content: Text("You just tapped $name"));
//   Scaffold.of(context).showSnackBar(snackBar);
// }

// List<String> getListItem() {
//   var items = List<String>.generate(1000, (counter) => "Item $counter");
//   return items;
// }
//
// Widget getListView() {
//   var listItems = getListItem();
//
//   var listView = ListView.builder(itemBuilder: (context, index) {
//     return ListTile(
//       leading: Icon(Icons.arrow_right),
//       title: Text(listItems[index]),
//       onTap: () {
//         debugPrint('${listItems[index]} was tapped');
//       },
//     );
//   });
//   return listView;
// }

/* listview
Widget getListView() {
  var listview = ListView(
    children: const <Widget>[
      ListTile(
          leading: Icon(Icons.landscape),
          title: Text("LandScape"),
          subtitle: Text("Beautiful view"),
          trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.co_present),
        title: Text("People"),
        subtitle: Text("View"),
      ),
      ListTile(
        leading: Icon(Icons.laptop),
        title: Text("Laptop"),
        subtitle: Text("Beautiful"),
        trailing: Icon(Icons.ac_unit),
      ),
      Text("Hello my friend"),
    ],
  );
  return listview;
}
*/

/*
class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "First Flutter App",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("My First App Screen"),),
            body: FirstScreen()));
  }
}
*/
