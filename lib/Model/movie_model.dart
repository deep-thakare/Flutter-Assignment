class Movie {
  final String title;
  final String genre;
  final String imdbRating;
  final String poster;

  Movie({
    required this.title,
    required this.genre,
    required this.imdbRating,
    required this.poster,
  });

  static Movie fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      genre: json['Genre'] ?? 'N/A' ,
      imdbRating: json['imdbRating'] ?? 'N/A',
      poster: json['Poster'] == 'N/A' ? 
              'https://via.placeholder.com/100x130' : 
              json['Poster'],
    );
  }
}
