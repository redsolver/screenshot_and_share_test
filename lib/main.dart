import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
        controller: screenshotController,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Screenshot\'n Share'),
          ),
          body: Center(
            child: RaisedButton(
              child: Text('Take a screenshot and share'),
              onPressed: () {
                screenshotController.capture().then((File image) async {
                  //Capture Done
                  await Share.file('my screenshot', 'screenshot.png',
                      image.readAsBytesSync(), 'image/png',
                      text: 'A cool screenshot.');
                }).catchError((onError) {
                  print(onError);
                });
              },
            ),
          ),
        ));
  }
}
