import 'dart:ui';

class MoviesData{
  late String name;
  late String posterVertical;
  late String posterHorizontal;
  late String desc;

  late double rate;

  late int releaseDate;

  MoviesData(String name, String posterVertical,String posterHorizontal ,double rate, int releaseDate){
    this.name = name;
    this.rate = rate;
    this.posterVertical = posterVertical;
    this.releaseDate = releaseDate;
    this.posterHorizontal = posterHorizontal;
  }
}