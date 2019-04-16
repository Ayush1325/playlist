import 'package:flutter/material.dart';

class MusicItem extends StatefulWidget {
  MusicItem({Key key, this.name, this.artist}): super(key: key);
  final String name;
  final String artist;

  @override
  _MusicItem createState() => _MusicItem();
}

class _MusicItem extends State<MusicItem> {

  @override
  Widget build(BuildContext context) {
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
            onPressed: null,
          ),
        ],
      ),
    );
  }
}