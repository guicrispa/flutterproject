import 'package:flutter/material.dart';
import 'batman.dart';
 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Flutter - Filmes Populares',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Batman: O Cavaleiro das Trevas',
      releaseYear: 2008,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/batmandarkknight.jpg',
    ),
    Movie(
      title: '007 - Operação Skyfall',
      releaseYear: 2012,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/007.png',
    ),
    Movie(
      title: 'Cidade de Deus',
      releaseYear: 2002,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/cidadededeus.jpg',
    ),
    Movie(
      title: 'O Resgate',
      releaseYear: 2020,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/resgate.jpg',
    ),
    Movie(
      title: 'Tropa de Elite',
      releaseYear: 2007,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/tropadeelite.jpg',
    ),
    Movie(
      title: 'Capitão América 2 - O Soldado Invernal',
      releaseYear: 2014,
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339873/samples/capitaoamericasoldadoinvernal.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes Populares - Everson, Guilherme e Sabrina'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Batman()),
          );
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final int releaseYear;
  final String imageUrl;

  Movie({
    required this.title,
    required this.releaseYear,
    required this.imageUrl,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container( // Ajuste a altura do card
      child: Card(
        child: ListTile(
          leading: Image.network(
            movie.imageUrl,
            fit: BoxFit.cover,
          ),
          title: Text(movie.title),
          subtitle: Text('Ano de lançamento: ${movie.releaseYear}'),
        ),
      ),
    );

    
  }
}
