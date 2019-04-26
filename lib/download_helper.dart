import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'shared/abstracts/download_helper_abstract.dart';
import 'shared/blocs/download_bloc.dart';
import 'shared/blocs/download_event.dart';
import 'dart:io';

class DownloadHelper extends DownloadHelperAbstract {
  Future<bool> _checkPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }
      else {
        return false;
      }
    }
    return true;
  }

  void setListener(DownloadBloc downloadBloc){
    FlutterDownloader.registerCallback((String id, dynamic status, int progress){
      if (status == DownloadTaskStatus.complete) {
        downloadBloc.dispatch(CompletedDownloadEvent(id));
      }
    });
  }

  void start(String name, String url) async {
    if (await _checkPermission()) {
      final directory = await getExternalStorageDirectory();
      final path = directory.path + '/Download/Playlist';
      Directory(path).create(recursive: true);
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: path,
        fileName: name,
        showNotification: true,
        // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      );
    }
  }

  void dispose() {
    FlutterDownloader.registerCallback(null);
  }
}