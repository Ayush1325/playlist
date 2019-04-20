import 'shared/abstracts/music_controls_abstract.dart';
import 'package:media_player/media_player.dart';
import 'package:media_player/data_sources.dart';
import 'package:bloc/bloc.dart';
import 'shared/blocs/music_player_event.dart';
import 'package:playlist/shared/data_classes/song_data.dart';

class MusicControls extends MusicControlsAbstract {
  MediaPlayer _player;

  MusicControls(){
    _player = MediaPlayerPlugin.create(isBackground: true, showNotification: true);
    _player.initialize();
  }

  void startListener(Bloc bloc) {
    _player.valueNotifier.addListener(() {
      bloc.dispatch(NotificationMusicPlayerEvent(0, _player.valueNotifier.value.getCurrrentMediaFile.title,
          _player.valueNotifier.value.isPlaying, _player.valueNotifier.value.duration));
    });
  }

  void init(List<SongData> state) async {
    List<MediaFile> _playlist = [];
    for(var item in state) {
      _playlist.add(MediaFile(title: item.title, type: 'audio', source: item.songUrl, image: item.songUrl, desc: item.artist));
    }
    Playlist playlist = Playlist(_playlist);
    await _player.setPlaylist(playlist);
  }

  void play() async {
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