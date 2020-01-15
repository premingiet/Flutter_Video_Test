import 'package:fvc/Listener/ListenerWidgetVideo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WidgetVideo.dart';

class WidgetLaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ListenerWidgetVideo listenerWidgetVideo = Provider.of<ListenerWidgetVideo>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("FLUTTER VIDEO CONTAINER TEST"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
                child: Container(
                  width: double.infinity,
                  height: 240.0,
                  child: WidgetVideo(),
                )
            ),
            RaisedButton.icon(
              onPressed: (() => {
                listenerWidgetVideo.PickLocalFile(),
                debugPrint("______Browse local file______")
              }),
              icon: Icon(Icons.mouse),
              label: Text("Choose Video"),
            ),
            RaisedButton.icon(
              onPressed: (() => {
                listenerWidgetVideo.LoadAssetVideo(),
                debugPrint("______Load Video From Asset______")
              }),
              icon: Icon(Icons.all_inclusive),
              label: Text("Load Asset Video"),
            ),
          ],
        ),
      ),
    );
  }
}
