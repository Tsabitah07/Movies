import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text(widget.movie.name),
      // backgroundColor: Colors.black45.withOpacity(.2),
      // elevation: 0,),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
              color: Colors.black45,
              image: DecorationImage(
                image: AssetImage(widget.movie.posterHorizontal),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(top: 31, left: 27),
              height: 39,
              width: 39,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icon/back.svg',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * .73 ,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21), topRight: Radius.circular(21)
                    ),
                    boxShadow: [BoxShadow(
                        color: Colors.white.withOpacity(.3),
                        offset: Offset(0, -4),
                        blurRadius: 7
                    )]
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Transform.translate(
                            offset: Offset(10, -39), // Adjust the X and Y values for the desired offset
                            child: Image.asset(
                              widget.movie.posterVertical,
                              width: 113,
                              height: 157,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Text(widget.movie.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27
                                  ),),
                              ),
                              Padding(padding: EdgeInsets.only(left: 23),
                                child: Text("Release In " + widget.movie.releaseDate.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17
                                  ),),
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 23),
                                    child: Text("Rate : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17
                                      ),),
                                  ),
                                  RatingBar.builder(
                                    initialRating: widget.movie.rate.toDouble(),
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
                                    onRatingUpdate: (rating) {},
                                    ignoreGestures: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 19, right: 17),
                                child: Text(
                                  'Available In ${widget.movie.watchApp}',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 19, right: 17, top: 7), // Remove top margin for "Genre"
                                child: Text(
                                  'Genre : ${widget.movie.genre}',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 19, right: 17, top: 7),
                                child: Text("Synopsis : ",
                                  style: TextStyle(
                                    fontSize: 17
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 19, right: 17, top: 5),
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 70),
                                child: Text(
                                  widget.movie.desc,
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
