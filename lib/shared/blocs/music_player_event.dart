import 'package:meta/meta.dart';

@immutable
abstract class MusicPlayerEvent {
  final int id;
  MusicPlayerEvent(this.id);
}

class InitialMusicPlayerEvent extends MusicPlayerEvent {
  InitialMusicPlayerEvent(int id): super(id);
}

class ToggleMusicPlayerEvent extends MusicPlayerEvent {
  ToggleMusicPlayerEvent(int id): super(id);
}