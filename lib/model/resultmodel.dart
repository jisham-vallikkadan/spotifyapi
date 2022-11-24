class Spotifyresult {
  String? artistName;
  String? artworkUrl100image;
  String? description;
  String? collectionName;
  Spotifyresult({
    this.artistName,
    this.artworkUrl100image,
    this.description,
    this.collectionName,
  });

  factory Spotifyresult.fromJson(Map<String, dynamic> responce) {
    return Spotifyresult(
      artistName: responce['artistName'],
      artworkUrl100image: responce['artworkUrl100'],
      description: responce['description'],
      collectionName: responce['collectionName'],
    );
  }
}
