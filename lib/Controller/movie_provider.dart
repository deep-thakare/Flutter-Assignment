
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  bool _loading = false;

  List<Movie> get movies => _movies;
  bool get loading => _loading;

  Future<void> fetchMovies(String query) async {
    _loading = true;
    notifyListeners(); 

    final response = await http.get(
      Uri.parse('http://www.omdbapi.com/?s=$query&apikey=6bf2e935'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Search'] != null) {
        List<Movie> movies = [];
        for (var movie in data['Search']) {
         
          final detailResponse = await http.get(
            Uri.parse('http://www.omdbapi.com/?i=${movie["imdbID"]}&apikey=6bf2e935'),
          );
          if (detailResponse.statusCode == 200) {
            final movieDetail = json.decode(detailResponse.body);
            movies.add(Movie.fromJson(movieDetail));
          }
        }
        _movies = movies;
      }
    }
    
    _loading = false;
    notifyListeners(); 
  }
}
