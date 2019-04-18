import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataProvider extends SongsProviderAbstract {
  Future<List<Map<String, dynamic>>> get songs async {
    List<Map<String, dynamic>> temp = [];
    final appSnapshot = await Firestore.instance.collection('app').document('app_info').get();
    final appData = appSnapshot.data;

    final songsListSnapshot = await Firestore.instance.collection(appData['playlist']).orderBy('id').getDocuments();
    for (var item in songsListSnapshot.documents) {
      temp.add(item.data);
    }
    return temp;
  }
}