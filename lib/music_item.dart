import 'package:flutter/material.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/music_player_event.dart';
import 'shared/blocs/download_bloc.dart';
import 'shared/blocs/download_event.dart';

class MusicItem extends StatefulWidget {
  MusicItem({Key key, this.name, this.artist, this.id}): super(key: key);
  final String name;
  final String artist;
  final int id;

  @override
  _MusicItem createState() => _MusicItem();
}

class _MusicItem extends State<MusicItem> {
  @override
  Widget build(BuildContext context) {
    final _musicPlayerBloc = BlocProvider.of<MusicPlayerBloc>(context);
    final _downloadBloc = BlocProvider.of<DownloadBloc>(context);
    return Ink(
      color: Colors.amberAccent,
      child: InkWell(
        onTap: () => _musicPlayerBloc.dispatch(InitialMusicPlayerEvent(widget.id)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.artist,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () {_downloadBloc.dispatch(NormalDownloadEvent(widget.id));},
              ),
            ],
          ),
        ),
      ),
    );
  }
}