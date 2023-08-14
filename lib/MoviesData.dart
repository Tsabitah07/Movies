import 'dart:ui';

class MoviesData{
  late String name;
  late String poster;
  late double rate;

  late int releaseDate;

  MoviesData(String name, String poster,double rate, int releaseDate){
    this.name = name;
    this.rate = rate;
    this.poster = poster;
    this.releaseDate = releaseDate;
  }
}