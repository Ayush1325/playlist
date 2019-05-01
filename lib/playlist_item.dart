import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {

  final String art;
  final String name;
  PlaylistItem({Key key, this.name, this.art});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 2,
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
    );
  }
}