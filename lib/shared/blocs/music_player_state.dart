import 'package:meta/meta.dart';

@immutable
abstract class MusicPlayerState {
  final String name;
  final String artist;
  final bool state;
  final int id;

  MusicPlayerState(this.name, this.artist, this.state, this.id);
}

class InitialMusicPlayerState extends MusicPlayerState {
  InitialMusicPlayerState(): super('Test', 'Tp', false, 0);
}

class NormalMusicPlayerState extends MusicPlayerState {
  NormalMusicPlayerState(name, artist, state, id): super(name, artist, state, id);
}
