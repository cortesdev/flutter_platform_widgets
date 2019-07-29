import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_switch.dart';
 
  
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
        child: Container(
          color: Colors.pink[300],
          child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_circle, size: 45.0, color: Colors.white,),
                              Text("Hello, Ricci.", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                        child: Text("Welcome to Pinker", style: TextStyle(color: Colors.white),),
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
          Container(
              child: Column(
                children: <Widget>[
                    Divider(),                    
                    ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings')),
                    ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help and Feedback')),
                    ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('logout'))
                  ],
                )
              )
            ]
          )
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
            child: AppBar(title: Text('Pinkr', style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.transparent, //No more green
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.search, color: Colors.white, ),
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
                   
                  ],
                ),
              ),
            ), 
              Center(
              child: Container(
                height: 340.0,            
            
            ),
            ),
        ],
        
      )
      
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


