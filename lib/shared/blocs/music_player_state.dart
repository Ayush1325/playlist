import 'package:meta/meta.dart';

@immutable
abstract class MusicPlayerState {
  final String name;
  final bool state;
  final int id;

  MusicPlayerState(this.name, this.state, this.id);
}

class InitialMusicPlayerState extends MusicPlayerState {
  InitialMusicPlayerState(): super('Test', false, 0);
}

class NormalMusicPlayerState extends MusicPlayerState {
  NormalMusicPlayerState(name, state, id): super(name, state, id);
}
