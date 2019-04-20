import 'package:bloc/bloc.dart';

abstract class MusicControlsAbstract {
  void startListener(Bloc bloc);
  void init(List<Map<String, dynamic>> state);
  void play();
  void pause();
  void stop();
}