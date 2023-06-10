import 'package:flutter/material.dart';
 
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        DetalhesPagina.routeName: (context) => DetalhesPagina(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Batman: O Cavaleiro das Trevas',
      releaseYear: 2008,
      roteiro: 'Gênero: Super-Herói. \n Batman: O Cavaleiro das Trevas se passa em Gotham City, onde o Batman, interpretado por Christian Bale, continua sua luta contra o crime. Desta vez, ele enfrenta um dos seus maiores desafios: o Coringa, interpretado por Heath Ledger',
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/batmandarkknight.jpg',
    ),
    Movie(
      title: '007 - Operação Skyfall',
      releaseYear: 2012,
      roteiro: 'Gênero: Ação \n Após uma missão mal-sucedida em Istanbul, James Bond é dado como morto e desaparece do radar. Enquanto o MI6 é atacado e ameaçado de exposição, M, a chefe do serviço secreto britânico, se vê diante de um passado sombrio que volta para assombrá-la. Com o MI6 sendo atacado, 007 retorna para proteger M e confrontar a ameaça.',
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/007.png',
    ),
    Movie(
      title: 'Cidade de Deus',
      releaseYear: 2002,
      roteiro: 'Gênero: Filme Nacional \n O filme se passa na Cidade de Deus, uma favela violenta e empobrecida localizada nos arredores do Rio de Janeiro. A história começa na década de 1960, com a infância de Buscapé, um jovem morador da favela que sonha em se tornar um fotógrafo. Buscapé narra a história do filme e observa de perto o crescimento do tráfico de drogas na comunidade.',
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/cidadededeus.jpg',
    ),
    Movie(
      title: 'O Resgate',
      releaseYear: 2020,
      roteiro: 'Gênero: Ação \n Tyler Rake, um mercenário endurecido interpretado por Chris Hemsworth, é contratado para resgatar o filho sequestrado de um chefão do crime internacional. Ambientado em Dhaka, capital de Bangladesh, o filme segue Tyler em uma missão perigosa e cheia de reviravoltas.',
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/resgate.jpg',
    ),
    Movie(
      title: 'Tropa de Elite',
      releaseYear: 2007,
      roteiro: 'Gênero: Filme Nacional \n O filme se passa no Rio de Janeiro, em um contexto de violência generalizada causada pelo tráfico de drogas. O Capitão Nascimento, interpretado por Wagner Moura, é o líder do BOPE, uma tropa especializada em operações de alto risco. Ele está cansado da corrupção policial e da falta de resultados na luta contra o crime.',
      imageUrl:
          'https://res.cloudinary.com/dlsuopwkn/image/upload/v1686339871/samples/tropadeelite.jpg',
    ),
    Movie(
      title: 'Capitão América 2 - O Soldado Invernal',
      releaseYear: 2014,
      roteiro: 'Gênero: Super-Herói. \n Capitão América se une à Viúva Negra e ao Falcão para desmascarar os segredos obscuros da agência e enfrentar o misterioso Soldado Invernal, um assassino com uma conexão pessoal com o Capitão. O filme é repleto de ação eletrizante, reviravoltas surpreendentes e explora o conflito entre lealdade, dever e liberdade.',
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
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetalhesPagina.routeName,
                arguments: movies[index],
              );
            },
            child: MovieCard(
              movie: movies[index],
            ),
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
  final String roteiro;

  Movie({
    required this.title,
    required this.releaseYear,
    required this.imageUrl,
    required this.roteiro,
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

class DetalhesPagina extends StatelessWidget {
  static const routeName = '/movie-detail';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Text(
              movie.roteiro,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}