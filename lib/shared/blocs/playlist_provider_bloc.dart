import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'songs_provider_bloc.dart';
import 'songs_provider_event.dart';

class PlaylistProviderBloc extends Bloc<PlaylistProviderEvent, PlaylistProviderState> {
  SongsProviderAbstract songsProviderAbstract;
  MusicProviderBloc musicProviderBloc;

  PlaylistProviderBloc({this.songsProviderAbstract, this.musicProviderBloc});

  @override
  PlaylistProviderState get initialState => InitialPlaylistProviderState();

  @override
  Stream<PlaylistProviderState> mapEventToState(
    PlaylistProviderEvent event,
  ) async* {
    final list = await songsProviderAbstract.getPlaylists();
    for (var item in list) {
      musicProviderBloc.dispatch(OnlineSongProviderEvent(item));
    }
    yield NormalPlaylistProviderState(list);
  }
}
