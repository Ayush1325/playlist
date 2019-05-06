import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/playlist_provider_event.dart';
import 'shared/blocs/playlist_provider_bloc.dart';
import 'firebase_data_provider.dart';
import 'bottom_controls.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'music_controls.dart';
import 'playlist_list.dart';

class PlaylistPage extends StatefulWidget {

  @override
  _PlaylistPage createState() => _PlaylistPage();
}

class _PlaylistPage extends State<PlaylistPage> {

  PlaylistProviderBloc _playlistProviderBloc;
  MusicPlayerBloc _musicPlayerBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<PlaylistProviderBloc>(bloc: _playlistProviderBloc),
        BlocProvider<MusicPlayerBloc>(bloc: _musicPlayerBloc,),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Playlist"),
        ),
        body: PlaylistList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _playlistProviderBloc.dispatch(DefaultPlaylistProviderEvent()),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomSheet: BottomControls(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final dataProvider = FirebaseDataProvider();
    _musicPlayerBloc = MusicPlayerBloc(musicControls: MusicControls());
    _playlistProviderBloc = PlaylistProviderBloc(songsProviderAbstract: dataProvider);
    _playlistProviderBloc.dispatch(DefaultPlaylistProviderEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _playlistProviderBloc.dispose();
  }
}