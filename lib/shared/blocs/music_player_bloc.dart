import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:playlist/shared/abstracts/music_controls_abstract.dart';
import 'music_provider_bloc.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final MusicControlsAbstract musicControls;
  final MusicProviderBloc musicProviderBloc;

  MusicPlayerBloc({@required this.musicControls, @required this.musicProviderBloc})
      : assert(musicControls != null && musicProviderBloc != null);

  @override
  MusicPlayerState get initialState => InitialMusicPlayerState();

  @override
  Stream<MusicPlayerState> mapEventToState(
    MusicPlayerEvent event,
  ) async* {
    if (event is InitialMusicPlayerEvent) {
      musicControls.stop();
      musicControls.init();
      musicControls.play(musicProviderBloc.currentState.songs[event.id]['url']);
      yield InitialMusicPlayerState(name: musicProviderBloc.currentState.songs[event.id]['name'],
          artist: musicProviderBloc.currentState.songs[event.id]['artist'],
          state: true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    musicControls.stop();
  }


}
