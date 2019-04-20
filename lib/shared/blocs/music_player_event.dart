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

// Only for Flutter
class NotificationMusicPlayerEvent extends MusicPlayerEvent {
  final Duration duration;
  final bool isPlaying;
  final String title;

  NotificationMusicPlayerEvent(int id, this.title, this.isPlaying, this.duration): super(id);
}