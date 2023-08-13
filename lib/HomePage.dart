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
    MoviesData pacific_rim = new MoviesData("Pacific Rim", "3.5 / 5", 'assets/image/pacific_rim.png', 2013);
    favoriteMovie?.add(MoviesData("The Maze Runner", "4 / 5", 'assets/image/the_maze_runner.png', 2014));
    favoriteMovie?.add(MoviesData("Divergent", "4 / 5", 'assets/image/divergent.png', 2014));
    favoriteMovie?.add(MoviesData("Interstellar", "4.5 / 5", 'assets/image/interstellar.png', 2014));
    favoriteMovie?.add(MoviesData("Annihilation", "4 / 5", 'assets/image/annihilation.png', 2018));
    favoriteMovie?.add(MoviesData("Ender's Game", "3.5 / 5", 'assets/image/enders_game.png', 2013));

    favoriteMovie?.add(pacific_rim);
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
                color: Color.fromARGB(0, 410, 411, 50),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(favoriteMovie![index].name,
                          style: TextStyle(
                            color: Colors.white
                          ),),
                          Text(favoriteMovie![index].rate),
                          Text(favoriteMovie![index].releaseDate.toString()),
                        ],
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
