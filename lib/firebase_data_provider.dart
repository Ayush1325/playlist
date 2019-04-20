import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playlist/shared/data_classes/song_data.dart';

class FirebaseDataProvider extends SongsProviderAbstract {
  Future<List<SongData>> getSongs() async {
    List<SongData> temp = [];
    final appSnapshot = await Firestore.instance.collection('app').document('app_info').get();
    final appData = appSnapshot.data;

    final songsListSnapshot = await Firestore.instance.collection(appData['playlist']).orderBy('id').getDocuments();
    for (var item in songsListSnapshot.documents) {
      temp.add(SongData.fromMap(item.data));
    }
    return temp;
  }
}