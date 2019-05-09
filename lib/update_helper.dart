import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class UpdateHelper {
  BuildContext context;
  String appUrl;

  UpdateHelper(this.context) {
    _update();
  }

  Future<bool> _checkForUpdate() async {
    final appSnapshot = await Firestore.instance.collection('app').document('app_info').get();
    final appData = appSnapshot.data;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if(appData['versionCode'] > int.tryParse(packageInfo.buildNumber)) {
      appUrl =  appData['appUrl'];
      return true;
    }
    return false;
  }

  void _listener(String taskId) {
    FlutterDownloader.registerCallback((id, status, progress) {
      if (status == DownloadTaskStatus.complete) {
        if(id == taskId) {
          FlutterDownloader.open(taskId: id);
          _dispose();
        }
      }
    });
  }

  void _update() async {
    if(await _checkForUpdate()) {
      _showAlertDialog();
    }
  }

  void _startUpdate() async {
    final directory = await getExternalStorageDirectory();
    final path = directory.path + '/Download/Playlist/Update';
    Directory(path).create(recursive: true);
    final taskId = await FlutterDownloader.enqueue(
      url: appUrl,
      fileName: 'app_release.apk',
      savedDir: path,
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );
    _listener(taskId);
  }

  void _showAlertDialog() {
    // set up the button
    Widget updateButton = FlatButton(
      child: Text("Update"),
      onPressed: () {
        _startUpdate();
        Navigator.of(context).pop();
        },
    );

    Widget laterButton = FlatButton(
      child: Text("Later"),
      onPressed: () { Navigator.of(context).pop(); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update"),
      content: Text("A new version of app is available."),
      actions: [
        updateButton,
        laterButton
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _dispose() {
    FlutterDownloader.registerCallback(null);
  }
}