import 'dart:ui';

class MoviesData{
  late String name;
  late String posterVertical;
  late String posterHorizontal;
  late String desc;
  late String watchApp;
  late String genre;

  late double rate;

  late int releaseDate;

  MoviesData(String name, String posterVertical,String posterHorizontal, String genre, String watchApp, String desc, double rate, int releaseDate){
    this.name = name;
    this.rate = rate;
    this.posterVertical = posterVertical;
    this.releaseDate = releaseDate;
    this.posterHorizontal = posterHorizontal;
    this.genre = genre;
    this.watchApp = watchApp;
    this.desc = desc;
  }
}