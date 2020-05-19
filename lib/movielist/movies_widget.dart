import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'movies_service.dart';
import 'moviesresponse.dart';


class MoviesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        title: Text('Movies List'),
      ),
      body: FutureBuilder<MoviesResponse>(
        future: MoviesAPIService.fetchMovies(),
        builder: (context, state) {
          print(state.hasError);
          if (state.hasError) print(state.error);

          return state.hasData
              ? MoviesList(response : state.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


class MoviesList extends StatelessWidget {
  final MoviesResponse response;

  MoviesList({Key key, this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.results.length,
      itemBuilder: (context, index) {
        return
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            margin:  EdgeInsets.all(20),
            child:
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,8),
                    child: Text('Title : ${response.results[index].title}', style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),maxLines: 2,textAlign: TextAlign.center,),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,8),
                    child: Text('Release Date : ${getFormattedDate(response.results[index].releaseDate)}', style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),maxLines: 2,textAlign: TextAlign.center,),),
                      FadeInImage.assetNetwork(
                          placeholder: 'assets/gifs/image_loader.gif',
                          image: 'https://image.tmdb.org/t/p/w300_and_h450_bestv2/${response.results[index].imageUrl}',
                          width: 400,
                          height: 250,
                          fit:BoxFit.contain),
                ],
              ),
            ), );

      },
    );
  }

  String getFormattedDate(String date) {
    var dateTime = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("dd MMM yyyy").format(dateTime);
  }

}