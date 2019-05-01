import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/playlist_provider_bloc.dart';
import 'shared/blocs/playlist_provider_state.dart';
import 'playlist_item.dart';

class PlaylistList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth + 34;

    final _playlistBloc = BlocProvider.of<PlaylistProviderBloc>(context);
    return BlocBuilder(
      bloc: _playlistBloc,
      builder: (BuildContext context, PlaylistProviderState state) {
        return GridView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: state.playlists.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          itemBuilder: (BuildContext context, int index) {
            return PlaylistItem(
              name: state.playlists[index],
              art: "https://firebasestorage.googleapis.com/v0/b/playlist-7fe8a.appspot.com/o/Plalist_For_The_Dead%2Fart%2F13_Alison.jpg?alt=media&token=5d3536f1-9156-452d-a33e-a940e37e60bf",
            );
          },
        );
      }
    );
  }
}