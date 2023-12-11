import 'package:flutter/material.dart';
import 'package:myhero/model/heroes.dart';

class DetailScreen extends StatelessWidget {
  final Heroes hero;

  const DetailScreen({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(hero: hero);
        } else {
          return DetailMobilePage(hero: hero);
        }
      }
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Heroes hero;

  const DetailMobilePage({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 236, 236),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red[900],
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const FavoriteButton(),
                  ],
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Container(
                    height: 350,
                    child: Hero(
                      tag: hero.imageAsset, 
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                        hero.imageAsset
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  hero.name,
                  style: TextStyle(
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red[900],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Deskripsi',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  hero.description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
            ),
          ),  
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final Heroes hero;

  const DetailWebPage({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 300, 
              vertical: 20
            ),
            child: Card(
              color: Color.fromARGB(255, 237, 236, 236),
              child: Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[   
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red[900],
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const FavoriteButton(),
                  ],
                ),             
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 350,
                        child: Hero(
                          tag: hero.imageAsset, 
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                            hero.imageAsset
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Text(
                      hero.name,
                      style: TextStyle(
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.red[900],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Deskripsi',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      hero.description,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
                ),
              ),
            ),
          ), 
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red[900],
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}