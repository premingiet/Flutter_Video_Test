import 'package:fvc/Listener/ListenerWidgetVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:provider/provider.dart';

class WidgetVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ListenerWidgetVideo listenerWidgetVideo = Provider.of<ListenerWidgetVideo>(context);

    debugPrint("_________ VIDEO PLAYER BUILT ________");
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      color: Colors.lightGreen,
      child: IjkPlayer(
        mediaController: listenerWidgetVideo.Controller,
      ),
    );
  }
}
