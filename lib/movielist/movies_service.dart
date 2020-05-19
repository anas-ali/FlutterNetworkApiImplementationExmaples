import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'moviesresponse.dart';
import 'package:http/http.dart' as http;

class MoviesAPIService {

  static Future<MoviesResponse> fetchMovies() async {
    final response =
    await http.get('http://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2020-01-01&api_key=716986d85d2bd6a411177d7b9d1ab174');
    // Use the compute function to run parseMovies in a separate isolate.
    return compute(parseMovies, response.body);
    //return parseMovies(response.body);
  }

// A function that converts a response body into a List<Photo>.
  static MoviesResponse parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return MoviesResponse.fromJson(parsed);
  }

}