import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class ListenerWidgetVideo extends ChangeNotifier {
  //============================ GLOBAL VARIABLES =============================
  IjkMediaController _Controller = IjkMediaController();
  IjkStatus _status;
  String _localVideo = "";

  //xxxxxxxxxxxxxxxxxxxxxxxxxxxx GLOBAL VARIABLES xxxxxxxxxxxxxxxxxxxxxxxxxxxxx


  //================================= GETTER ==================================
  IjkMediaController get Controller => _Controller;

  IjkStatus get VideoStatus => _status;

  String get LocalVideo => _localVideo;

  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx GETTER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


  //================================= SETTER ==================================
  set Controller(IjkMediaController controller) {
    _Controller = controller;
    notifyListeners();
  }

  set LocalVideo(String localvideopath) {
    _localVideo = localvideopath;
    Controller.setNetworkDataSource(localvideopath, autoPlay: true);
    notifyListeners();
  }

  set VideoStatus(IjkStatus status) {
    _status = status;
    notifyListeners();
  }

  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx SETTER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


  //================================= METHODS =================================
  GetPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      if (permissions.values.elementAt(0) == PermissionStatus.granted) {
        debugPrint("______Permission Granted_______");
        if(LocalVideo != "") {
          Controller.setNetworkDataSource(LocalVideo, autoPlay: true);
          notifyListeners();
        }
      }
    }
  }

  PickLocalFile() async {
    await GetPermission();
    File file = await FilePicker.getFile();
    LocalVideo = file.path;
    notifyListeners();
  }

  LoadAssetVideo() async {
    await GetPermission();
    Controller.setAssetDataSource("Assets/Video/TestAssetVideo.mp4", autoPlay: true);
    notifyListeners();
    notifyListeners();
  }

  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx METHODS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


  //============================== CONSTRUCTOR ================================
  ListenerWidgetVideo() {
    GetPermission();
    debugPrint("______Initialized______");
  }
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx CONSTRUCTOR xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

}
