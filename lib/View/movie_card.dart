import 'package:flutter/material.dart';
import 'package:flutter_assignment/Model/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsCard extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double rating = double.tryParse(movie.imdbRating) ?? 0.0;
    Color ratingColor = rating < 7 ? const Color(0xff1C7EEB) : const Color(0xff5EC570);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(66, 0, 0, 0),
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.poster,
                  width: 100,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Display genres
                    Text(
                      movie.genre.replaceAll(', ', ' | '), 
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 131, 131, 131),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                        color: ratingColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.imdbRating,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "IMDB",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
