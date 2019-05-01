import 'package:meta/meta.dart';

@immutable
abstract class SongsProviderEvent {
  final String playlist;
  SongsProviderEvent(this.playlist);
}

class OnlineSongProviderEvent extends SongsProviderEvent {
  OnlineSongProviderEvent(String name): super(name);
}