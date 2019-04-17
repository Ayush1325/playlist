import 'package:audioplayer/audioplayer.dart';
import 'shared/abstracts/music_controls_abstract.dart';

class MusicControls extends MusicControlsAbstract {
  AudioPlayer _audioPlayer;

  void init() {
    _audioPlayer = AudioPlayer();
  }

  void play(String url) async {
    await _audioPlayer.play(url);
  }

  void pause() async {
    await _audioPlayer.pause();
  }

  void stop() async {
    try {
      await _audioPlayer.stop();
    }catch(e){}
  }
}