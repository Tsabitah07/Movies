import 'package:flutter/material.dart';
import 'package:movies/MoviesData.dart';

class DetailPage extends StatefulWidget {
  final MoviesData movie;

  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.name)),
    );
  }
}
