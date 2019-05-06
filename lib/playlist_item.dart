import 'package:flutter/material.dart';
import 'songs_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/playlist_provider_bloc.dart';
import 'shared/blocs/music_player_bloc.dart';

class PlaylistItem extends StatelessWidget {

  final String art;
  final String name;
  PlaylistItem({Key key, this.name, this.art});

  @override
  Widget build(BuildContext context) {
    final _playlistProvider= BlocProvider.of<PlaylistProviderBloc>(context);
    final _musicPlayerBloc = BlocProvider.of<MusicPlayerBloc>(context);
    return Card(
      color: Colors.amber,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => SongsPage(musicProviderBloc: _playlistProvider.currentState.playlists[name], title: name, musicPlayerBloc: _musicPlayerBloc,)),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage(
                placeholder: AssetImage('assets/playlist_placeholder.png'),
                image: NetworkImage(art),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}