import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotifyapi/model/resultmodel.dart';


class SpotifyApi {
  Future<List<Spotifyresult>> getsong(String artistName) async {
    final url = 'https://itunes.apple.com/search?term=$artistName';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);
      List<Spotifyresult> listData = List<Spotifyresult>.from(
          body['results'].map((e) => Spotifyresult.fromJson(e))).toList();
      return listData;
    } else {
      List<Spotifyresult> listData = [];
      return listData;
    }
  }
}
