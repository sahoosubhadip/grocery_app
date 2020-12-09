import 'package:flutter/material.dart';
import 'package:grocery_app/SignIn.dart';

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Opacity(
        opacity: 0.75,
        child: Image.asset(
          "assets/Entry1.jpg",
          fit: BoxFit.cover,
// height: double.infinity,
        ),
      ),
      Positioned(
          top: 70,
          left: 20,
          child: Text(
            "Eat Organic\nEveryday ",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 50,
                fontWeight: FontWeight.bold),
          )),
      Positioned(
          top: 220,
          left: 10,
          child: Text(
            "Get Grocery done on your Fingertip  !",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 19,
                fontWeight: FontWeight.normal),
          )),
      Positioned(
          bottom: 50,
          // left: 120,
          right: 60,
          child: GestureDetector(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                child: ((Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 45.0,
                  //semanticLabel: "Let's start",
                ))),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  //borderRadius: BorderRadius.all(Radius.circular(20))
                )),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>SignIn()),
              );
            },
          ))
    ]));
  }
}
