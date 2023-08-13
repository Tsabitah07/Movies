import 'package:flutter/material.dart';
import 'MoviesData.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MoviesData>? favoriteMovie = [];

  @override
  void initState() {
    super.initState();
    favoriteMovie?.add(MoviesData("Pacific Rim", "3.5 / 5", 'assets/image/pacific_rim.png', 2013));
    favoriteMovie?.add(MoviesData("The Maze Runner", "4 / 5", 'assets/image/the_maze_runner.png', 2014));
    favoriteMovie?.add(MoviesData("Divergent", "4 / 5", 'assets/image/divergent.png', 2014));
    favoriteMovie?.add(MoviesData("Interstellar", "4.5 / 5", 'assets/image/interstellar.png', 2014));
    favoriteMovie?.add(MoviesData("Annihilation", "4 / 5", 'assets/image/annihilation.png', 2018));
    favoriteMovie?.add(MoviesData("Ender's Game", "3.5 / 5", 'assets/image/enders_game.png', 2013));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(7),
            itemCount: favoriteMovie?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.black45,
                margin: EdgeInsets.all(11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 17, left: 13, right: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(favoriteMovie![index].poster,
                      width: 107, height: 143,),
                      SizedBox(width: 10), // Add some spacing between the image and text
                      Padding(
                        padding: const EdgeInsets.only(top: 19, left: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(favoriteMovie![index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: Text("Rate : " + favoriteMovie![index].rate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),),
                            ),
                            Text("Release Date : " + favoriteMovie![index].releaseDate.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
