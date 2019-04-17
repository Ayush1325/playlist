import 'package:flutter/material.dart';
import 'music_item.dart';
import 'shared/blocs/music_provider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/songs_state.dart';

class SongsListWidget extends StatelessWidget {
  const SongsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _musicProviderBloc = BlocProvider.of<MusicProviderBloc>(context);
    return BlocBuilder(
        bloc: _musicProviderBloc,
        builder: (BuildContext context, SongsState state) {
          return ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (BuildContext context, int index) {
              return MusicItem(name: state.songs[index]['name'], artist: state.songs[index]['artist'], id: index,);
            },
          );
        }
    );
  }
}
