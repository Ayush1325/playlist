import 'package:flutter/material.dart';
import 'shared/blocs/songs_provider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/songs_provider_event.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'song_list.dart';
import 'music_controls.dart';
import 'firebase_data_provider.dart';
import 'bottom_controls.dart';
import 'shared/blocs/download_bloc.dart';
import 'download_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Playlist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MusicProviderBloc _musicProviderBloc;
  MusicPlayerBloc _musicPlayerBloc;
  DownloadBloc _downloadBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<MusicProviderBloc>(bloc: _musicProviderBloc,),
        BlocProvider<MusicPlayerBloc>(bloc: _musicPlayerBloc,),
        BlocProvider<DownloadBloc>(bloc: _downloadBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SongsListWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _musicProviderBloc.dispatch(SongsProviderEvent.ONLINE),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomSheet: BottomControls(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicProviderBloc = MusicProviderBloc(songsProvider: FirebaseDataProvider());
    _musicPlayerBloc = MusicPlayerBloc(musicControls: MusicControls(), musicProviderBloc: _musicProviderBloc);
    _musicProviderBloc.dispatch(SongsProviderEvent.ONLINE);
    _downloadBloc = DownloadBloc(musicProviderBloc: _musicProviderBloc, downloadHelperAbstract: DownloadHelper());
  }

  @override
  void dispose() {
    super.dispose();
    _musicProviderBloc.dispose();
    _downloadBloc.dispose();
  }


}