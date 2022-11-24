import 'package:flutter/material.dart';

import 'package:spotifyapi/model/resultmodel.dart';
import 'package:spotifyapi/service/spotifyapi.dart';
import 'deatilspage.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  SpotifyApi spotifyApi = SpotifyApi();

  TextEditingController artistcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Songs'), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
        child: Column(
          children: [
            TextField(
              controller: artistcontroler,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter ArtistName',
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      setState(() {});
                    },
                  )),
            ),
            Expanded(
              child: Container(
                child: FutureBuilder<List<Spotifyresult>>(
                  future: spotifyApi.getsong(artistcontroler.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          var songs = snapshot.data![index];
                          return GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Secondpage(songs),));
                          },
                            child: Card(
                              elevation: 10,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(songs
                                              .artworkUrl100image
                                              .toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          songs.collectionName.toString(),
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.white),
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          songs.artistName.toString(),
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
