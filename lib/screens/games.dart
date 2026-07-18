import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api_service.dart';
import '../models/game_model.dart';


class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}


class _GamesScreenState extends State<GamesScreen> {

  late Future<List<GameModel>> games;


  @override
  void initState() {
    super.initState();
    games = ApiService.getGames();
  }


  Future<void> openLink(String link) async {

    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "🎮 GX20D Games",
          style: TextStyle(
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),


      body: FutureBuilder<List<GameModel>>(

        future: games,

        builder: (context, snapshot) {


          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.cyan,
              ),
            );

          }


          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );

          }


          final data = snapshot.data ?? [];


          if (data.isEmpty) {

            return const Center(
              child: Text(
                "No Games Found",
                style: TextStyle(color: Colors.white),
              ),
            );

          }


          return GridView.builder(

            padding: const EdgeInsets.all(12),

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,

              childAspectRatio: 0.65,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

            ),


            itemCount: data.length,


            itemBuilder: (context, index) {

              final game = data[index];


              return Container(

                decoration: BoxDecoration(

                  color: const Color(0xff1c1c1c),

                  borderRadius: BorderRadius.circular(15),

                ),


                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,


                  children: [


                    ClipRRect(

                      borderRadius:
                          const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),


                      child: Image.network(

                        "https://gx20d-gaming.great-site.net/uploads/games/${game.image}",

                        height: 150,

                        width: double.infinity,

                        fit: BoxFit.cover,


                        errorBuilder:
                            (context,error,stackTrace){

                          return const SizedBox(

                            height:150,

                            child: Icon(
                              Icons.image,
                              size:60,
                              color:Colors.white,
                            ),

                          );

                        },

                      ),

                    ),



                    Padding(

                      padding:
                          const EdgeInsets.all(8),


                      child: Text(

                        game.gameName,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(

                          color: Colors.cyan,

                          fontSize: 17,

                          fontWeight: FontWeight.bold,

                        ),

                      ),

                    ),



                    Padding(

                      padding:
                          const EdgeInsets.symmetric(horizontal:8),


                      child: Text(

                        game.platform,

                        style: const TextStyle(

                          color: Colors.amber,

                        ),

                      ),

                    ),



                    const Spacer(),



                    Padding(

                      padding:
                          const EdgeInsets.all(8),


                      child: SizedBox(

                        width: double.infinity,


                        child: ElevatedButton(

                          onPressed: (){

                            openLink(game.link);

                          },


                          style:
                              ElevatedButton.styleFrom(

                            backgroundColor:
                                Colors.cyan,

                          ),


                          child: const Text(
                            "تحميل",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),

                        ),

                      ),

                    )

                  ],

                ),

              );

            },

          );


        },

      ),

    );

  }

}