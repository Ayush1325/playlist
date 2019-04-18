import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/blocs/music_player_bloc.dart';
import 'shared/blocs/music_player_state.dart';
import 'shared/blocs/music_player_event.dart';

class BottomControls extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _musicPlayerBloc = BlocProvider.of<MusicPlayerBloc>(context);
    return BlocBuilder(
      bloc: _musicPlayerBloc,
      builder: (BuildContext context, MusicPlayerState state) {
        if (state is InitialMusicPlayerState) {
          return Container(height: 0,);
        }
        return Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  state.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: state.state? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: () => _musicPlayerBloc.dispatch(ToggleMusicPlayerEvent(state.id)),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}