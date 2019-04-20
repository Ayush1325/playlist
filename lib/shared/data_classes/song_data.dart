class SongData {
  String title;
  String artist;
  String songUrl;
  String artUrl;
  int id;

  SongData(this.id, this.title, this.artist, this.songUrl, this.artUrl);

  SongData.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['name'];
    this.artist = map['artist'];
    this.songUrl = map['url'];
    this.artUrl = map['art'];
  }
}