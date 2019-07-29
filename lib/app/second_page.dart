import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_switch.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
  
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _switchValue = false;

  void _showHelpDialog(BuildContext context) async {
    PlatformAlertDialog(
      title: 'Buttons',
      content: 'Operating System: ' + Platform.operatingSystem,
      confirmText: 'Dismiss',
    ).show(context);
  }

  void _platformSwitchChanged(BuildContext context, bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return Scaffold(
      drawer: Drawer(
         child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                      child: Text("Hello, Ricci.", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                    ),                    
                  ],
                ),                
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Account'),
                onTap: () {
                   setState(() {
                    Navigator.pop(context);
                  });
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
      ),      
      body: Stack(
          children: <Widget>[
          Container( //My container or any other widget
            color: Colors.pink[300],
          ),
            new Positioned( //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(title: Text('Bluetr'),
              backgroundColor: Colors.transparent, //No more green
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.search),
                ),
              ],
              elevation: 0.0, //Shadow gone
            ),
          ),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                      child: Text("Hello, Ricci.", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                    ),
                    Text("Looks like feel good.", style: TextStyle(color: Colors.white),),
                    Text("You have 3 tasks to do today.", style: TextStyle(color: Colors.white,),),
                  ],
                ),
              ),
            ), 
              Center(
              child: Container(
                height: 340.0,            
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  itemBuilder: (BuildContext context, int index) {
                    if(index % 2 == 0) {
                      return _buildCarousel(context, index ~/ 2);
                    }
                    else {
                      return Divider();
                    }
                  },
              ),
            ),
            ),
        ],
        
      )
      
    );
  }

   Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex', style: TextStyle( color: Colors.white,)),
         SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 300.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
 

Widget buildRow({String text, Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20.0)),
        child,
      ],
    );
}


