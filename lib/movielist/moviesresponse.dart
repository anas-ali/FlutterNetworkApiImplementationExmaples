

import 'movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'moviesresponse.g.dart';

@JsonSerializable()
class MoviesResponse {
  int page;
  List<Movie> results;

  MoviesResponse(this.page, this.results);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson()=>_$MoviesResponseToJson(this);

/*  MoviesResponse.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = (json['results'] as List).map((movie)=> Movie.fromJson(movie)).toList();*/

  //flutter pub run build_runner build
}