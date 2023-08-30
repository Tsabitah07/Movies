import 'dart:ui';

class MoviesData{
  late String name;
  late String posterVertical;
  late String posterHorizontal;
  late String desc;

  late double rate;

  late int releaseDate;

  MoviesData(String name, String poster,double rate, int releaseDate){
    this.name = name;
    this.rate = rate;
    this.posterVertical = poster;
    this.releaseDate = releaseDate;
  }
}