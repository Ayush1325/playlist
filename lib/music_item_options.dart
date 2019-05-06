import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/download_bloc.dart';
import 'shared/blocs/download_event.dart';

enum Actions {DOWNLOAD, DELETE, REMOVE}

class MusicItemOptions extends StatelessWidget {

  final bool isDownloaded;
  final int id;
  MusicItemOptions({Key key, this.isDownloaded, this.id});

  @override
  Widget build(BuildContext context) {
    final _downloadBloc = BlocProvider.of<DownloadBloc>(context);
    if (isDownloaded) {
      return PopupMenuButton(
        onSelected: (Actions result){
          if(result == Actions.DOWNLOAD) {
            _downloadBloc.dispatch(NormalDownloadEvent(id));
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Actions>>[
          const PopupMenuItem<Actions>(
            value: Actions.DOWNLOAD,
            child: Text("Download"),
          ),
          const PopupMenuItem<Actions>(
            value: Actions.REMOVE,
            child: Text("Remove"),
          ),
        ],
      );
    }
    else {
      return PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Actions>>[
          const PopupMenuItem<Actions>(
            value: Actions.DELETE,
            child: Text("Delete"),
          ),
          const PopupMenuItem<Actions>(
            value: Actions.REMOVE,
            child: Text("Remove"),
          ),
        ],
      );
    }
  }
}