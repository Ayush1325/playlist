import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'songs_provider_bloc.dart';
import 'songs_provider_event.dart';

class PlaylistProviderBloc extends Bloc<PlaylistProviderEvent, PlaylistProviderState> {
  SongsProviderAbstract songsProviderAbstract;

  PlaylistProviderBloc({this.songsProviderAbstract});

  @override
  PlaylistProviderState get initialState => InitialPlaylistProviderState();

  @override
  Stream<PlaylistProviderState> mapEventToState(
    PlaylistProviderEvent event,
  ) async* {
    final list = await songsProviderAbstract.getPlaylists();
    Map<String,MusicProviderBloc> temp = Map();
    for (String item in list) {
      temp[item] = MusicProviderBloc(songsProvider: songsProviderAbstract);
      temp[item].dispatch(OnlineSongProviderEvent(item));
    }
    yield NormalPlaylistProviderState(temp);
  }
}
