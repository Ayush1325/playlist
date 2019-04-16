import 'package:flutter/material.dart';
import 'music_item.dart';

final dummy = {'name': "How to Disappear Completely", 'artist': "Radiohead", 'url': "https://firebasestorage.googleapis.com/v0/b/playlist-7fe8a.appspot.com/o/Plalist_For_The_Dead%2F01_How_to_Disappear_Completely.mp3?alt=media&token=7059f2c6-aa45-445f-b7fd-c3cab61c46bd"};

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return MusicItem(name: dummy['name'], artist: dummy['artist'],);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
