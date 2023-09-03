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
    favoriteMovie?.add(MoviesData("Pacific Rim", 'assets/image/pacific_rim.png','assets/poster/pacific_rim.png',"Action, Adventure, Sci-fi", "Netflix",
        "Long ago, legions of monstrous creatures called Kaiju arose from the sea, bringing with them all-consuming war. To fight the Kaiju, mankind developed giant robots called Jaegers, designed to be piloted by two humans locked together in a neural bridge. However, even the Jaegers are not enough to defeat the Kaiju, and humanity is on the verge of defeat. Mankind's last hope now lies with a washed-up ex-pilot (Charlie Hunnam), an untested trainee (Rinko Kikuchi) and an old, obsolete Jaeger.",
        4.5, 2013));
    favoriteMovie?.add(MoviesData("The Maze Runner", 'assets/image/the_maze_runner.png','assets/poster/the_maze_runner.png',"Sci-fi, Action", "Disney+ Hotstar",
        "Thomas (Dylan O'Brien), a teenager, arrives in a glade at the center of a giant labyrinth. Like the other youths dumped there before him, he has no memory of his previous life. Thomas quickly becomes part of the group and soon after demonstrates a unique perspective that scores him a promotion to Runner status -- those who patrol the always-changing maze to find an escape route. Together with Teresa (Kaya Scodelario), the only female, Thomas tries to convince his cohorts that he knows a way out.",
        4.0, 2014));
    favoriteMovie?.add(MoviesData("Divergent", 'assets/image/divergent.png','assets/poster/divergent.png',"Action, Adventure, Mystery", "Netflix",
        "Tris Prior (Shailene Woodley) lives in a futuristic world in which society is divided into five factions. As each person enters adulthood, he or she must choose a faction and commit to it for life. Tris chooses Dauntless -- those who pursue bravery above all else. However, her initiation leads to the discovery that she is a Divergent and will never be able to fit into just one faction. Warned that she must conceal her status, Tris uncovers a looming war which threatens everyone she loves.",
        4.3, 2014));
    favoriteMovie?.add(MoviesData("Interstellar", 'assets/image/interstellar.png','assets/poster/interstellar.png',"Adventure, Drama, Sci-fi", "Netflix",
        "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand (Michael Caine), a brilliant NASA physicist, is working on plans to save mankind by transporting Earth's population to a new home via a wormhole. But first, Brand must send former NASA pilot Cooper (Matthew McConaughey) and a team of researchers through the wormhole and across the galaxy to find out which of three planets could be mankind's new home.",
        5.0, 2014));
    favoriteMovie?.add(MoviesData("Annihilation", 'assets/image/annihilation.png','assets/poster/annihilation.png',"Drama, Horor, Sci-fi", "Netflix",
        "Lena, a biologist and former soldier, joins a mission to uncover what happened to her husband inside Area X -- a sinister and mysterious phenomenon that is expanding across the American coastline. Once inside, the expedition discovers a world of mutated landscapes and creatures, as dangerous as it is beautiful, that threatens both their lives and their sanity.",
        4.0, 2018));
    favoriteMovie?.add(MoviesData("Ender's Game", 'assets/image/enders_game.png','assets/poster/enders_game.png',"Sci-fi, Action, Adventure", "Netflix",
        "When hostile aliens called the Formics attack Earth, only the legendary heroics of Mazer Rackham (Ben Kingsley) manage to attain a victory. To prepare for the next attack, Col. Hyrum Graff (Harrison Ford) and his cohorts initiate a military program to find the next Mazer. Recruit Ender Wiggin (Asa Butterfield) exhibits an unusual gift for the training, easily mastering all of the challenges thrown at him. Mazer Rackham, himself, takes Ender as a protege to prepare him for the oncoming war.",
        4.5, 2013));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie List", style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold
      ),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        }, child: Center(
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
                        Image.asset(favoriteMovie![index].posterVertical,
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
                                    },
                                    ignoreGestures: true,
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
      )
    );
  }
}
