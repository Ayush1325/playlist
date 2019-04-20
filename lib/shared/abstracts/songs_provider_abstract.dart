import 'package:playlist/shared/data_classes/song_data.dart';

abstract class SongsProviderAbstract {
  Future<List<SongData>> getSongs();
}