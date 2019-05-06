import 'package:meta/meta.dart';
import 'songs_provider_bloc.dart';

@immutable
abstract class PlaylistProviderState {
  final Map<String,MusicProviderBloc> playlists;
  PlaylistProviderState(this.playlists);
}

class InitialPlaylistProviderState extends PlaylistProviderState {
  InitialPlaylistProviderState(): super(Map());
}

class NormalPlaylistProviderState extends PlaylistProviderState {
  NormalPlaylistProviderState(Map<String,MusicProviderBloc> list): super(list);
}
