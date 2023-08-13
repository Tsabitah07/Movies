import 'dart:ui';

class MoviesData{
  late String name;
  late String rate;
  late String poster;

  late int releaseDate;

  MoviesData(String name,String rate, String poster, int releaseDate){
    this.name = name;
    this.rate = rate;
    this.poster = poster;
    this.releaseDate = releaseDate;
  }
}