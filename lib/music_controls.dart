import 'shared/abstracts/music_controls_abstract.dart';
import 'package:media_player/media_player.dart';
import 'package:media_player/data_sources.dart';

class MusicControls extends MusicControlsAbstract {
  MediaPlayer _player;

  MusicControls(){
    _player = MediaPlayerPlugin.create(isBackground: true, showNotification: true);
  }

  void init() async {
    await _player.initialize();
  }

  void play(Map<String, dynamic> state) async {
    MediaFile song = MediaFile(title: state['name'], type: 'audio', source: state['url']);
    await _player.setSource(song);
    await _player.play();
  }

  void pause() async {
    await _player.pause();
  }

  void stop() async {
    try {
      await _player.dispose();
    }catch (r){}
  }
}