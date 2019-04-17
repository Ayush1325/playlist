import 'package:flutter/material.dart';
import 'shared/blocs/music_provider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/songs_provider_event.dart';
import 'song_list.dart';

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

  final _musicProviderBloc = MusicProviderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        bloc: _musicProviderBloc,
        child: SongsListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _musicProviderBloc.dispatch(SongsProviderEvent.ONLINE),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _musicProviderBloc.dispatch(SongsProviderEvent.ONLINE);
  }

  @override
  void dispose() {
    super.dispose();
    _musicProviderBloc.dispose();
  }


}