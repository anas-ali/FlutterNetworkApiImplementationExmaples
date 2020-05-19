import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String title;
  @JsonKey(name: 'poster_path')
  String imageUrl;
  @JsonKey(name: 'release_date')
  String releaseDate;

  Movie(this.title, this.imageUrl, this.releaseDate);
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  /*Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imageUrl = json['poster_path'],
        releaseDate = json['release_date'];

  Map<String, dynamic> toJson() => {
      'title' : title,
      'poster_path' : imageUrl,
      'release_date' : releaseDate
  };*/
}