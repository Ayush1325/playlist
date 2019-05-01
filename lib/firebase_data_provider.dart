import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playlist/shared/data_classes/song_data.dart';
import 'package:recase/recase.dart';

class FirebaseDataProvider extends SongsProviderAbstract {
  Future<List<String>> getPlaylists() async {
    final appSnapshot = await Firestore.instance.collection('app').document('app_info').get();
    final appData = appSnapshot.data;
    List<String> temp = [];
    for(var item in appData['playlist']) {
      temp.add(item.toString());
    }
    print(temp);
    return temp;
  }

  Future<List<SongData>> getSongs(String playlist) async {
    final name = ReCase(playlist).snakeCase;
    List<SongData> temp = [];
    final songsListSnapshot = await Firestore.instance.collection(name).orderBy('id').getDocuments();
    for (var item in songsListSnapshot.documents) {
      temp.add(SongData.fromMap(item.data));
    }
    return temp;
  }
}