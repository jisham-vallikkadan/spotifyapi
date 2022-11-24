import 'package:flutter/material.dart';
import 'package:spotifyapi/model/resultmodel.dart';
 class Secondpage extends StatefulWidget {
   Spotifyresult songs;
    Secondpage(this.songs, {Key? key}) : super(key: key);

   @override
   State<Secondpage> createState() => _SecondpageState();
 }

 class _SecondpageState extends State<Secondpage> {

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black87,
       appBar: AppBar(title: Center(child: Text('${widget.songs.artistName}')),backgroundColor: Colors.black87,),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           width: double.infinity,
           height: double.infinity,
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
            Container(
              width: 200,
              child:
            Image(image: NetworkImage('${widget.songs.artworkUrl100image}'),fit: BoxFit.cover,),
              height: 200,
            ),
               SizedBox(height: 10),
               Text('${widget.songs.collectionName}',style: TextStyle(color: Colors.white,fontSize: 20),),
               Text('${widget.songs.description}',style: TextStyle(color: Colors.white),)

             ],
           ),

         ),
       ),

     );
   }


}
