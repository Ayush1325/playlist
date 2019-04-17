import 'package:playlist/shared/abstracts/music_data_provider_interface.dart';

class FirebaseDataProvider implements MusicDataProviderInterface {
  Future<List<Map<String, String>>> get songs async {
    List<Map<String, String>> temp = [];
    final dummy = {'name': "How to Disappear Completely", 'artist': "Radiohead", 'url': "https://firebasestorage.googleapis.com/v0/b/playlist-7fe8a.appspot.com/o/Plalist_For_The_Dead%2F01_How_to_Disappear_Completely.mp3?alt=media&token=7059f2c6-aa45-445f-b7fd-c3cab61c46bd"};
    temp.add(dummy);
    return temp;
  }
}