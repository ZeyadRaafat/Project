import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        backgroundColor: const Color(0xFFF8F1E7), // Set background color
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F1E7), // Set background color
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Popular Destinations',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Madimi One',
          ),
        ),
        actions: [
          IconButton(onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchPage())),
          icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          List<String> imagePaths = [
            'images/cairo.jpg',
            'images/alexandria.jpg',
            'images/Luxur.jpg',
            'images/siwa.jpg',
            'images/hurghada.jpg',
            'images/cina.jpg',
          ];

          List<String> texts = [
            '   Cairo ,Egypt ',
            '   Alexandria,Egypt',
            '   Luxor and Aswan,Egypt',
            '   Siwa,Egypt',
            '   Hurghada,Egypt',
            '   Cina,Egypt',
          ];

          String imagePath = imagePaths[index];
          String text = texts[index];
          bool isFavorite = favoriteItems.contains(text);

          return Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Countries(
              imagePath: imagePath,
              text: text,
              isFavorite: isFavorite,
              onFavoritePressed: () {
                setState(() {
                  if (isFavorite) {
                    favoriteItems.remove(text);
                  } else {
                    favoriteItems.add(text);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Countries extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const Countries({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F1E7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  width: 380,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: onFavoritePressed,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Madimi One',
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? Key}):super(key: Key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child:TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(icon: const Icon(Icons.clear),
                onPressed: (){},)
              ),
            ) ,),
        )
      ),
    );
  }
}