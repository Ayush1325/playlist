import 'package:flutter/material.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/music_player_event.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name),
              Text(widget.artist),
            ],
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () => _musicPlayerBloc.dispatch(InitialMusicPlayerEvent(widget.id)),
          ),
        ],
      ),
    );
  }
}