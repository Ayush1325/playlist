import 'package:meta/meta.dart';

@immutable
abstract class MusicPlayerState {}

class InitialMusicPlayerState extends MusicPlayerState {
  String name;
  String artist;
  bool state;

  InitialMusicPlayerState({this.name, this.artist, this.state});
}
