import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'MoviesData.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    favoriteMovie?.add(MoviesData("Pacific Rim", 'assets/image/pacific_rim.png', 4.5, 2013));
    favoriteMovie?.add(MoviesData("The Maze Runner", 'assets/image/the_maze_runner.png', 4.0, 2014));
    favoriteMovie?.add(MoviesData("Divergent", 'assets/image/divergent.png', 4.3, 2014));
    favoriteMovie?.add(MoviesData("Interstellar", 'assets/image/interstellar.png', 5.0, 2014));
    favoriteMovie?.add(MoviesData("Annihilation", 'assets/image/annihilation.png', 4.0, 2018));
    favoriteMovie?.add(MoviesData("Ender's Game", 'assets/image/enders_game.png', 4.5, 2013));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie List"),),
      body: Center(
        child: Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(7),
            itemCount: favoriteMovie?.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(movie: favoriteMovie![index]),
                    ),
                  );
                },
                child: Card(
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
                                padding: const EdgeInsets.only(top: 17),
                                child: Text("Release In " + favoriteMovie![index].releaseDate.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17
                                  ),),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("Rate : ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: favoriteMovie![index].rate.toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 27,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
