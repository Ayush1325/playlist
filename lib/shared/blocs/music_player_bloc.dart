import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'music_player_event.dart';
import 'music_player_state.dart';
import 'package:playlist/shared/abstracts/music_controls_abstract.dart';
import 'songs_provider_bloc.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final MusicControlsAbstract musicControls;
  MusicProviderBloc _musicProviderBloc;

  MusicPlayerBloc({@required this.musicControls})
      : assert(musicControls != null) {
    musicControls.startListener(this);
  }

  void setMusicProvider(MusicProviderBloc musicProvider) {
    this._musicProviderBloc = musicProvider;
  }

  @override
  MusicPlayerState get initialState => InitialMusicPlayerState();

  @override
  Stream<MusicPlayerState> mapEventToState(
    MusicPlayerEvent event,
  ) async* {
    if (event is InitialMusicPlayerEvent) {
      try {
        musicControls.init(_musicProviderBloc.currentState.songs.sublist(event.id));
        musicControls.play();
        yield NormalMusicPlayerState(_musicProviderBloc.currentState.songs[event.id].title,
            true, event.id);
      }catch (e){}
    }
    else if (event is ToggleMusicPlayerEvent) {
      if (currentState.state) {
        musicControls.pause();
        yield NormalMusicPlayerState(currentState.name, false, event.id);
      }
      else {
        musicControls.play();
        yield NormalMusicPlayerState(currentState.name, true, event.id);
      }
    }
    else if (event is NotificationMusicPlayerEvent) {
      NotificationMusicPlayerEvent temp = event;
      if (temp.title != currentState.name) {
        yield NormalMusicPlayerState(temp.title,
            temp.isPlaying, event.id);
      }
      else if (currentState.state != temp.isPlaying) {
        yield NormalMusicPlayerState(temp.title,
            temp.isPlaying, event.id);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    musicControls.stop();
  }
}
