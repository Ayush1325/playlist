import 'package:meta/meta.dart';

@immutable
abstract class PlaylistProviderState {
  final List<String> playlists;
  PlaylistProviderState(this.playlists);
}

class InitialPlaylistProviderState extends PlaylistProviderState {
  InitialPlaylistProviderState(): super([]);
}

class NormalPlaylistProviderState extends PlaylistProviderState {
  NormalPlaylistProviderState(List<String> list): super(list);
}
