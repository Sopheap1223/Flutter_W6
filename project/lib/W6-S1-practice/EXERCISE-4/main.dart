import 'package:flutter/material.dart';

// Define the Joke model
class Joke {
  final int id;
  final String title;
  final String description;

  Joke({required this.id, required this.title, required this.description});
}

// Generate a list of 20 jokes
List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    id: index,
    title: 'Joke Title $index',
    description: 'This is the description of joke $index.',
  ),
);

void main() => runApp(const JokeApp());

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: const Text("Favorite Jokes"),
        ),
        body: const JokeList(),
      ),
    );
  }
}

// The main widget managing the list of jokes
class JokeList extends StatefulWidget {
  const JokeList({super.key});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? favoriteId; // Tracks the ID of the favorite joke

  // Callback to update the favorite joke
  void setFavorite(int id) {
    setState(() {
      favoriteId = (favoriteId == id) ? null : id; // Toggle favorite
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          joke: jokes[index],
          isFavorite: favoriteId == jokes[index].id,
          onFavoriteClick: () => setFavorite(jokes[index].id),
        );
      },
    );
  }
}

// The FavoriteCard widget
class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: Colors.green[300], fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
