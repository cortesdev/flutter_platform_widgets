import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_switch.dart';
  

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class RootScaffold {
  static openDrawer(BuildContext context) {
    final ScaffoldState scaffoldState =
        context.rootAncestorStateOfType(TypeMatcher<ScaffoldState>());
    scaffoldState.openDrawer();
  }
}
class _HomePageState extends State<HomePage> {
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
         decoration: BoxDecoration(
        // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.pink[600],
              Colors.pink[500],
              Colors.pink[400],
            ],
          ),
        ),
          child: Column(
          children: <Widget>[
            Expanded(
              child: ListTileTheme(
                 child: ListView(                              
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
                        // Box decoration takes a gradient
                                     
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.white,),
                    title: Text('Account', style: TextStyle(color: Colors.white),),
                    subtitle: Text("Logged in", style: TextStyle(color: Colors.grey[100])),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.white,),
                    title: Text('Second', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: Column(
                children: <Widget>[
                    Divider(),                    
                    ListTile(
                        leading: Icon(Icons.settings,  color: Colors.white,),
                        title: Text('Settings', style: TextStyle(color: Colors.white),)),
                    ListTile(
                        leading: Icon(Icons.help,  color: Colors.white,),
                        title: Text('Help and Feedback', style: TextStyle(color: Colors.white),)),
                    ListTile(
                        leading: Icon(Icons.exit_to_app,  color: Colors.white,),
                        title: Text('logout', style: TextStyle(color: Colors.white),))
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
            color: Colors.blue,
          ),
            new Positioned( //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(title: Text('Bluer', style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.transparent,
              iconTheme: new IconThemeData(color: Colors.white),//No more green
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
                height: 480.0,            
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
         Text('Carousel $carouselIndex', style: TextStyle( color: Colors.pink[100],)),
         SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 350.0,
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
          color: Colors.blue[600],
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


