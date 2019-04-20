import 'package:bloc/bloc.dart';
import 'package:playlist/shared/data_classes/song_data.dart';

abstract class MusicControlsAbstract {
  void startListener(Bloc bloc);
  void init(List<SongData> state);
  void play();
  void pause();
  void stop();
}