import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controller/movie_provider.dart';
import 'package:flutter_assignment/View/movie_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 206, 206),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff212121),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    movieProvider.fetchMovies(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff212121)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff212121)),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                         movieProvider.fetchMovies(_controller.text);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              movieProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : movieProvider.movies.isEmpty
                      ? const Expanded(child: Center(child: Text('No results found.')))
                      : Expanded(
                          child: ListView.builder(
                            
                            itemCount: movieProvider.movies.length,
                            itemBuilder: (context, index) {
                              final movie = movieProvider.movies[index];
                              return MovieDetailsCard(movie: movie);
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
