abstract class MusicDataProviderInterface {
  Future<List<Map<String, String>>> get songs;
}