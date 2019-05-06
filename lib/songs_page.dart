import 'package:flutter/material.dart';
import 'song_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/songs_provider_bloc.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'shared/blocs/download_bloc.dart';
import 'download_helper.dart';
import 'bottom_controls.dart';

class SongsPage extends StatefulWidget {

  final String title;
  final MusicProviderBloc musicProviderBloc;
  final MusicPlayerBloc musicPlayerBloc;
  SongsPage({Key key, this.title, this.musicProviderBloc, this.musicPlayerBloc});

  @override
  _SongsPage createState() => _SongsPage();
}

class _SongsPage extends State<SongsPage> {

  DownloadBloc _downloadBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<MusicProviderBloc>(bloc: widget.musicProviderBloc,),
        BlocProvider<DownloadBloc>(bloc: _downloadBloc),
        BlocProvider<MusicPlayerBloc>(bloc: widget.musicPlayerBloc,),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SongsListWidget(),
        bottomSheet: BottomControls(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _downloadBloc = DownloadBloc(musicProviderBloc: widget.musicProviderBloc, downloadHelperAbstract: DownloadHelper());
    widget.musicPlayerBloc.setMusicProvider(widget.musicProviderBloc);
  }

  @override
  void dispose() {
    super.dispose();
    _downloadBloc.dispose();
    widget.musicPlayerBloc.setMusicProvider(null);
  }
}